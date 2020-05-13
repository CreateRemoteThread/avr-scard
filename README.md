# avr-scard

this is an extremely minimal t0 iso7816 reader based off an atmega328p, communicating over serial at 9600 baud.

this implements a fixed wait after 5 bytes of APDU, but otherwise does not guarantee reponses for APDU's. the pyserial driver is currently a part of [sparkgap](https://github.com/createremotethread/sparkgap). The pin out is as follows:

- B4: Status LED
- B0: Target I/O
- B2: Target Reset
- B1: Target Clk
- C5: Trigger (after APDU Send)

this is based off https://www.makomk.com/2011/02/25/iso-7816-smartcard-interface-for-arduino/ 