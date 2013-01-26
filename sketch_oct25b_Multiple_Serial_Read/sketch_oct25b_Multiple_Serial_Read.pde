//Jason Stephens
//PComp wk 6 Lab:  Multiple Serial Read

/*Reads 3 Analog In and 1 Digital In, then outputs their values
Connections:  
Potentiameters on Analog 0,1.
PSR on Analog 2
Pushbutton on Digitial I/O 3
*/

int analog0 = 0;//pot
int analog1 = 1;//pot
int analog2 = 2;//psr
int digital3 = 3;//pushbutton

int sensorValue = 0 ; //reading from the sensor

void setup(){
  //configure the serial connection to Tronik from Arduino
  Serial.begin(9600);
  
  //configure the digital input
  pinMode(digital3, INPUT);
}

void loop (){
  // read the sensor 0
  sensorValue = analogRead(analog0);
  //print the results
  Serial.print(sensorValue, DEC);
  Serial.print (",");
  Serial.print('\t');
  
  // read the sensor 1
  sensorValue = analogRead(analog1);
  //print the results
  Serial.print(sensorValue, DEC);
  Serial.print (",");
  Serial.print('\t');
  
  // read the sensor 2
  sensorValue = analogRead(analog2);
  //print the results
  Serial.print(sensorValue, DEC);
  Serial.print (",");
  Serial.print('\t');
  
  // read the sensor digital3
  sensorValue = digitalRead(digital3);
  //print the results
  Serial.println(sensorValue, DEC);
  //notice the "Serial.println"  with "ln" making this the end.
  //print the last sensor value with  a println() so that
  //each set of four readings prints on a line by itself.
 
}
