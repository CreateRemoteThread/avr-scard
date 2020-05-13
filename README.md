# avr-scard

this is an extremely minimal t0 iso7816 reader based off an atmega328p, communicating over serial at 9600 baud.

this implements a fixed wait after 5 bytes of APDU, but otherwise does not guarantee reponses for APDU's. the pyserial driver is currently a part of [sparkgap](https://github.com/createremotethread/sparkgap).

this is based off https://www.makomk.com/2011/02/25/iso-7816-smartcard-interface-for-arduino/ 