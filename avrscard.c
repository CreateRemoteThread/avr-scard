#define F_CPU 16000000L

#include <avr/io.h>
#include <avr/interrupt.h>
#include <stdlib.h>
#include <stdio.h>
#include <util/delay.h>
#include "pewpew.h"

#define BAUD 9600 // define baud
#define BAUDRATE ((F_CPU)/(BAUD*16UL)-1) // set baud rate value for UBRR

#define INPUT 0
#define OUTPUT 1

#define HIGH 1
#define LOW 0

#define bit(b) (1UL << (b))

#define LED PINB4
#define DATA PINB0
#define RESET PINB2
#define CLOCK PINB1
#define TRIGGER PINC5

//#define RAW_DUMP
//#define DOUBLE_RATE
//#define IN_WIRE_ORDER

#define SEND_BITCNT 11
uint8_t send_bits[SEND_BITCNT];
volatile uint8_t scnt, sending;

volatile uint8_t recv, rcnt;

char currentLed = 0;

void toggleLed()
{
	digitalWrite(LED,currentLed);
	currentLed = 1 - currentLed;
	return;
}

// TIMER2 comp A match - used to send bits on interface
ISR(TIMER2_COMPA_vect) {
	if (++scnt >= SEND_BITCNT) {
		TCCR2B = 0; // disable timer
		TIFR2 = _BV(OCF2A) | _BV(OCF2B); // clear interrupt flags
		digitalWrite(DATA, HIGH);
		pinMode(DATA, INPUT);
		PCIFR = _BV(PCIF0); // clear pin change flag
		PCICR = _BV(PCIE0); // re-enable pin change interrupt

		sending = 0;
		} else {
		digitalWrite(DATA, send_bits[scnt]);
	}
}

char digitalRead(char pinselect)
{
	char c = PINB;
	if((c & (1 << pinselect)) == 0)
	{
		return 0;
	}
	else
	{
		return 1;
	}
}

// TIMER2 comp B match - used to receive bits on interface.
// The reason we use different comparator registers when sending
// and receiving is becasuse we want to sample the bit in the
// middle of the bit period.

char rxBuf[256];
int rxLen = 0;

ISR(TIMER2_COMPB_vect) {
	unsigned char rbit = digitalRead(DATA);
	if (rcnt++ == 8) {
		// toggleLed();
		// FIXME - we should check parity here but don't!
		TCCR2B = 0; // disable timer
		//PCIFR = _BV(PCIF0); // clear pin change flag
		PCICR = _BV(PCIE0); // re-enable pin change interrupt
		// report the byte of data to the computer
		// putchar('.');
		// putchar(recv);
		rxBuf[rxLen++] = recv;
		} else {
		//if(rbit == 0) putchar('0');
		//if(rbit == 1)  putchar('1');
		recv |= (rbit << rcnt);
	}
}

// We use PCINT0 to detect the start of an incoming byte from
// the smart card and set up timer 2 to sample the incoming bits
ISR(PCINT0_vect) {
	// toggleLed();
	if (digitalRead(DATA) == 0) {
		TCNT2 = 0; //reset timer
		TCCR2B = 0 << CS22 | 1 << CS21 | 0 << CS20; // enable in divide-by-8 mode
		TIMSK2 = bit(OCIE2B); // turn on compare B interrupt.
		PCICR = 0; // disable pin change interrupt.
		#ifdef IN_WIRE_ORDER
		rcnt = 10;
		#else
		rcnt = 0xfe; recv = 0;
		#endif
		//putchar('S');
	}
}

void uart_init (void)
{
	UBRR0H = (BAUDRATE>>8); // shift the register right by 8 bits
	UBRR0L = BAUDRATE; // set baud rate
	UCSR0B|= (1<<TXEN0)|(1<<RXEN0); // enable receiver and transmitter
	UCSR0C = (3<<UCSZ00);
}

int uart_transmit(char data  )
{
	while (!( UCSR0A & (1<<UDRE0))); // wait while register is free
	UDR0 = data; // load data in the register
	return 0;
}

unsigned char uart_receive( void )
{
	while ( !(UCSR0A & (1<<RXC0)) );
	return UDR0;
}

void sendAPDU(int length, char *buffer)
{
	int i = 0;
	if(length > 5)
	{
		for(i = 0;i < 5;i++)
		{
			sendISOChar(buffer[i]);
		}
		_delay_ms(100);
	}
	for(;i < length;i++)
	{
		sendISOChar(buffer[i]);
	}
	PORTC |= (1 << TRIGGER);
}

void main()
{
	uart_init();
	FILE mystdio = FDEV_SETUP_STREAM(uart_transmit, uart_receive, _FDEV_SETUP_RW);
	
	stdout = &mystdio;
	stdin = &mystdio;
	
	pinMode(LED, OUTPUT);
	_delay_ms(500);
	digitalWrite(LED, HIGH);
	_delay_ms(500);
	digitalWrite(LED, LOW);
	setup();
	
	int rxHead = 0;
	
	putchar('#');	
	putchar('\n');
	while(1)
	{
		char ch = getchar();
		if (ch == 'R')
		{
			// pulse RESET signal LOW
			digitalWrite(RESET, LOW);
			_delay_ms(50);
			digitalWrite(RESET, HIGH);
			putchar('A');
		} 
		else if (ch == 'r')
		{
			// pulse RESET signal HIGH
			digitalWrite(RESET, HIGH);
			_delay_ms(50);
			digitalWrite(RESET, LOW);
			putchar('A');
		}
		else if(ch == 'a')
		{
			char txBuf[256];
			char txLen;
			int txHead = 0;
			txLen = getchar();
			for(txHead = 0;txHead < txLen;txHead++)
			{
				txBuf[txHead] = getchar();
			}
			sendAPDU(txLen,txBuf);
			PORTC &= ~(1 << TRIGGER);
		}
		else if(ch == 'd')
		{
			putchar('#');
			putchar(rxLen);
			rxHead = 0;
			int rxLenCache = rxLen;
			for(rxHead = 0;rxHead < rxLenCache;rxHead++)
			{
				putchar(rxBuf[rxHead]);
			}
			rxLen = 0;
		}
	}
}

void setup() {
	sei();
	// TOP=OCR2A, disable
	TCCR2A = _BV(WGM21);
	TCCR2B = 0; // disable
	TIFR2 = _BV(OCF2A) | _BV(OCF2B); // clear interrupt flags

	#ifdef DOUBLE_RATE
	OCR2A = 93; // (372/2)/2
	OCR2B = 46; // OCR2A/2
	#else
	OCR2A = 186; // 372/2
	OCR2B = 93; // OCR2A/2
	#endif

	// TIMSK2 = _BIT(OCIE2A) for compare A interrupt, _BIT(OCIE2B) for compare B

	pinMode(DATA, INPUT);
	digitalWrite(DATA, HIGH); // enable internal pull-up.

	pinMode(RESET, OUTPUT);
	digitalWrite(RESET, LOW);
	_delay_ms(50);
	digitalWrite(RESET, HIGH); // FIXME

	// use timer 1 to generate a clock source
	pinMode(CLOCK, OUTPUT);
	TCCR1B = 0x00; // disable timer 1
	TCCR1A = 0x40; // normal mode, toggle OC1A on overflow
	#ifdef DOUBLE_RATE
	OCR1A = 0; // count to 0 for a clock of 16 MHz / (2*(0+1)) = 8Mhz
	#else
	OCR1A = 1; // count to 1 for a clock of 16 MHz / (2*(1+1)) = 4Mhz
	#endif
	TCCR1B = 0x09; // reset timer on OCR1 match, prescaler 1, enable.

	#ifdef RAW_DUMP
	PCICR = 0; // disable pin change interrupt.
	TCNT2 = 0; //reset timer
	TCCR2B = 0 << CS22 | 1 << CS21 | 0 << CS20; // enable in divide-by-8 mode
	TIMSK2 = _BV(OCIE2B); // turn on compare B interrupt.
	rcnt = 8;
	#else
	// Now enable pin change interrupt
	PCMSK0 = _BV(PCINT0);
	PCICR = _BV(PCIE0);
	#endif
	
	DDRC |= (1 << TRIGGER);
}

void sendISOChar(uint8_t c) {
	char parity = 0;
	cli();
	TCCR2B = 0; // disable timer
	TIFR2 = _BV(OCF2A) | _BV(OCF2B); // clear interrupt flags
	PCIFR = _BV(PCIF0); // clear pin change flag
	PCICR = 0; // disable pin change interrupt
	sei();

	for (char i = 0; i < 8; i++) {
		parity ^= (send_bits[i + 1] = (c >> i) & 1);
	}
	send_bits[9] = parity;
	for (char i = 10; i < SEND_BITCNT; i++) send_bits[i] = 1;

	sending = 1; scnt = 0;
	// DDRB |= (1 << PINB0);
	pinMode(DATA, OUTPUT);
	TCNT2 = 0; //reset timer
	TIMSK2 = bit(OCIE2A); // turn on compare A interrupt.
	TCCR2B = 0 << CS22 | 1 << CS21 | 0 << CS20; // enable in divide-by-8 mode
	digitalWrite(DATA, LOW);
	while (sending) /* wait */;

	#if 1
	PCMSK0 = _BV(PCINT0);
	PCICR = _BV(PCIE0);
	#endif
}

void digitalWrite(char pinselect, char direction)
{
	if(direction == HIGH)
	{
		PORTB |= (1 << pinselect);	
	}
	else
	{
		PORTB &= ~(1 << pinselect);	
	}
}

void pinMode(char pinselect,char direction)
{
	if(direction == INPUT)
	{
		DDRB &= ~(1 << pinselect);	
	}
	else
	{
		DDRB |= (1 << pinselect);
	}
}
