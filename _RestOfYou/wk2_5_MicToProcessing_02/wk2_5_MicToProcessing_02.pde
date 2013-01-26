/* jason stephens
 Rest of You - wk2-5 ShowIt etc.
 Microphone to Processing
 
 SETUP:
 Electret Mic with 3 lines.  Consider a potentiometer with
 +5 and GND on the ends with a changing voltage on the center
 line. 
 
 TODO:
 _____Get the ABSOLUTE VALUE from Mic
 _____BlueTooth
 _____Connect To Processing
 
 */


int micVal=0;
int micPin = 0;

void setup () {
  Serial.begin(9600);

}

void loop () {
  
  micVal = analogRead(micPin);   //take a reading
  

//Serial.print("m");      //"m" = raw sensor data of Micro
Serial.println(micVal);  // send sensor data

 delay(20);  // break for 20mS. Processing frame-rate = 100.
 
}

