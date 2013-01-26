/*
 * MotorKnob
 *
 * A stepper motor follows the turns of a potentiometer
 * (or other sensor) on analog input 0.
 *
 * http://www.arduino.cc/en/Reference/Stepper
 * This example code is in the public domain.
 */

#include <Stepper.h>

// change this to the number of steps on your motor
#define STEPS 100

// create an instance of the stepper class, specifying
// the number of steps of the motor and the pins it's
// attached to
Stepper stepper(100, 8, 9, 10, 11);
Stepper stepper2(100, 7,6,5,4);


// the previous reading from the analog input
int previous = 0;
int x = 0;

int previous2 = 0;
int x2 = 0;

void setup()
{
  // set the speed of the motor to 30 RPMs
  stepper.setSpeed(50);
   stepper2.setSpeed(50);
  Serial.begin(9600);
}

void loop()
{
  // get the sensor value
  int val = analogRead(0);
  int val2 = analogRead(1);

  // move a number of steps equal to the change in the
  // sensor reading
  x2= val2-previous2;
  x = val-previous;
  Serial.print(previous);
  Serial.print('\t');
  Serial.print(val);
  Serial.print('\t');
  Serial.print(x);
  Serial.print('\t');
  stepper.step(x/6);
  
  Serial.print(previous2);
  Serial.print('\t');
  Serial.print(val2);
  Serial.print('\t');
  Serial.println(x2);
  stepper2.step(x2/6);

  // remember the previous value of the sensor
  previous = val;
  previous2 = val2;
}

