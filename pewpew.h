#ifndef PEWPEW_H_
#define PEWPEW_H_


char digitalRead(char pinselect);
void digitalWrite(char pinselect, char direction);
void pinMode(char pinselect,char direction);
void setup();
void sendISOChar(uint8_t c) ;

#endif /* PEWPEW_H_ */