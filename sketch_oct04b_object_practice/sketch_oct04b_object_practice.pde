/*
  Servo control from an analog input

 The minimum (minPulse) and maxiumum (maxPulse) values
 will be different depending on your specific servo motor.
 Ideally, it should be between 1 and 2 milliseconds, but in practice,
 0.5 - 2.5 milliseconds works well for me.
 Try different values to see what numbers are best for you.

 This program uses the millis() function to keep track of when the servo was
 last pulsed.  millis() produces an overflow error (i.e. generates a number
 that's too big to fit in a long variable) after about 5 days. if you're
 making a program that has to run for more than 5 days, you may need to
 account for this.

 by Tom Igoe
 additions by Carlyn Maw & Rob Faludi
 Created 28 Jan. 2006
 Updated 10 Jun. 2008
 */

 int servoPin = 2;     // Control pin for servo motor
 int minPulse = 900;   // Minimum servo position
 int maxPulse = 2500;  // Maximum servo position
 int pulse = 0;        // Amount to pulse the servo

 long lastPulse = 0;    // the time in milliseconds of the last pulse
 int refreshTime = 20; // the time needed in between pulses

 int analogValue = 0;  // the value returned from the analog sensor
 int analogPin = 0;    // the analog pin that the sensor's on

 void setup() {
  pinMode(servoPin, OUTPUT);  // Set servo pin as an output pin
  pulse = minPulse;           // Set the motor position value to the minimum
  Serial.begin(9600);
 }

 void loop() {
  analogValue = analogRead(analogPin);      // read the analog input
  pulse = map(analogValue,0,1023,minPulse,maxPulse);    // convert the analog value
                                                        // to a range between minPulse
                                                        // and maxPulse.

  // pulse the servo again if rhe refresh time (20 ms) have passed:
  if (millis() - lastPulse >= refreshTime) {
    digitalWrite(servoPin, HIGH);   // Turn the motor on
    delayMicroseconds(pulse);       // Length of the pulse sets the motor position
    digitalWrite(servoPin, LOW);    // Turn the motor off
    lastPulse = millis();           // save the time of the last pulse
  }
 }
