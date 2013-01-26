/* jason stephens
 Rest of You - wk2-5 ShowIt etc.
 Microphone to Processing
 
 SETUP:
 Electret Mic with 3 lines.  Consider a potentiometer with
 +5 and GND on the ends with a changing voltage on the center
 line. 
 
 TODO:
 _____BlueTooth
 _____Connect To Processing
 
 */


int micVal=0;
int micPin = 0;

void setup () {
  Serial.begin(9600);

}

void loop () {
  //either divide by 4 or map the range to 255 to keep it a byte
 micVal =  map(analogRead(micPin), 0, 1023, 0,255); 
 
Serial.println(micVal);
//Serial.write(micVal);

//delay(10);
}

