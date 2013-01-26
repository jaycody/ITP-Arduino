/* jason stephens
 Rest of You - wk1 Illusions
 Analog Input from Arduino to Processing
 ITP Fall 2011
 
 Setup:
 As I have no available Stretch Sensor, I'm using a FSR as the first of 2
 resistors from power to ground.  Between the 2 resistors, at the point of 
 voltage division, a lead runs to A0.  The anolog input on Pin A0 is functionaly
 the same as a voltmeter measuring the voltage at the voltage divider.  As the FSR
 resistance drops, the voltage at A0 increases from 0volts if the FSR is open, to 5V,
 if the FSR is closed at 0ohms.  Anaolog read of A0 is an 8bit convesion of the 
 anolog information which provides a range of 0-1024.  
 
 When sending this serially to Processing, the anolog read can be calibrated, smoothed,
 and mapped to 255.  The tutorial from Igoe asks what happens if the AnologRead is divided by 4,
 giving 255 from 1024, but the full range of the sensor is rarely used.  Calibrating the
 range first, and then mapping that range to 0-255 would allow for greater accuracy.
 
 1) Calibrating Range of Sensor
 set Min and Max sesnor value with code similar to brightest pixel search.  Create 
 5 second initial calibration period.  Start with sensorMin = 0 and sensorMax = 1023
 Then read pin and assign to sensorValue.  if larger than Max, set Max to that larger level.
 If smaller than Min, set Min to that value.
 
 2) Then Map the Calibrated Range to 0-255
 Calibration resets the Min-Max, then Mapping assigns the sensorMin to 0 and sensorMax to 255
 
 3) Smoothing (not this time)
 Place 10 measurements into an array and use the average of the 10 to smooth shit out
 
 NOTE:  
   Serial.Print vs Serial.Write....
     Print (println) Sends ASCII.  example ASCII 163 = 1,6,3 (where each digit requires a bit)
     Serial.Write sends out raw information.  example where 163 is represented by a single string of 10011010
   
   Serial.write(10); // carriage return    
 
 
 
 ToDo:
 Done____initial setup for Serial Read in Arduino
 Done_______Calibrate
 NO_______install CoolTerm??
 Done_______use Serial.println(analogValue, DEC); to change the ascii version of 1s and 0s to Decimal
 Done_______go for Processing.
 
 Here we go
 
 */
int analogMin = 1023; //initial state will decrease as lower levels are read and assigned to this variable
int analogMax = 0;
int analogValue = 0;


void setup() {
  Serial.begin(9600);  //start the same way, with an open comm link for the 2 machines
  
    while (millis() < 5000) {  // set calibration points in first 5 seconds
analogValue = analogRead(A0);
    //record the max sensor value and assign
    if (analogValue > analogMax){
      analogMax = analogValue;
    }

    //record the min sensor val and assign
    if (analogValue < analogMin){
      analogMin = analogValue; 
    }
  }
}

void loop(){
  analogValue = analogRead(A0);  //assign the 0-1023 conversion to this variable
  
  // apply the calibration to the sensor reading
  analogValue = map(analogValue, analogMin, analogMax, 0, 255);

  // in case the sensor value is outside the range seen during calibration
  analogValue = constrain(analogValue, 0, 255);



//  Serial.println(analogValue, DEC); //just for viewing in the Serial Monitor
 Serial.println(analogValue); //just for viewing in the Serial Monitor
  //Serial.write(analogValue);  
  //Serial.write sends the value to Serial (vs Showing/printing it)

}



