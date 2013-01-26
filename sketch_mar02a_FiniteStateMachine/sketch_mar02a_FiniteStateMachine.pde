const int switchPin = 2;    // switch input
const int motor1Pin = 3;    // H-bridge leg 1 (pin 2, 1A)
const int motor2Pin = 4;    // H-bridge leg 2 (pin 7, 2A)
const int motor5Pin = 5;    // H-bridge leg 1 (pin 2, 1A)
const int motor6Pin = 6;    // H-bridge leg 2 (pin 7, 2A)
const int enablePin = 9;    // H-bridge enable pin
const int enablePin11 = 11;    // H-bridge enable pin
const int led1 = 13;      // LED 
const int led0 = 12;      // LED 
const int inputDigitButton = 7;      // LED 

// counting the numbero of button presses
int SW1val = 0; //used to store the value of SW1
int old_SW1val = 0;  // used to store the previous value of SW1, so that the looping program doesn't keep reseting the SW1 state.
int SW1state = 0;  // 0= LED1 off | 1 = LED1 on
int SW1counter = 0;

int SW0val=0;
int old_SW0val=0;
int SW0state=0;
int SW0counter=0;

void setup() {
  Serial.begin(9600);
  // set the switch as an input:
  pinMode(switchPin, INPUT); 
  pinMode(inputDigitButton, INPUT);

  // set all the other pins you're using as outputs:
  pinMode(motor1Pin, OUTPUT); 
  pinMode(motor2Pin, OUTPUT); 
   pinMode(motor5Pin, OUTPUT); 
  pinMode(motor6Pin, OUTPUT); 
  pinMode(enablePin, OUTPUT);
  pinMode(enablePin11, OUTPUT);    // H-bridge enable pin
  pinMode(led1, OUTPUT);
  pinMode(led0, OUTPUT);

  // set enablePin high so that motor can turn on:
  digitalWrite(enablePin, HIGH); 
  digitalWrite(enablePin11, HIGH); 

 
}

void loop() {
  // if the switch is high, motor will turn on one direction:
  if (digitalRead(switchPin) == HIGH) {  // pressing for a 1
    digitalWrite(led1, HIGH);
    digitalWrite(led0, LOW);
  //  digitalWrite(motor1Pin, LOW);   // set leg 1 of the H-bridge low
    //digitalWrite(motor2Pin, HIGH);  // set leg 2 of the H-bridge high
  } 
  // if the switch is low, motor will turn in the other direction:
  else {
    digitalWrite(led1, LOW);
    digitalWrite(led0, HIGH);
    //digitalWrite(motor1Pin, HIGH);  // set leg 1 of the H-bridge high
    //digitalWrite(motor2Pin, LOW);   // set leg 2 of the H-bridge low
  }

  if (digitalRead(inputDigitButton) == HIGH) {
    digitalWrite(led1,HIGH);
    digitalWrite(led0,HIGH);
  }

  // if the 1 or 0 chooser switch is set to 1 AND the input button is pressed, then add 1 to the counter
  SW1val= digitalRead(inputDigitButton);
  if (SW1val != old_SW1val) {
    if ((SW1val == HIGH) && (digitalRead(switchPin) == HIGH)){
      SW1counter++;
      SW1state = 1 - SW1state;
      delay(20);
    }
  }
  old_SW1val = SW1val;
  
  
  // USE MODULOS to determine ODD or EVEN

  int x = SW1counter % 2;
  
  //if a remainder of 1, then odd
  if (x == 1) { //if remainder is one then odd
    digitalWrite(motor1Pin, HIGH);
    digitalWrite(motor2Pin, LOW);
  }
  
  // if remainder 0 AND the counter has already started, then EVEN (which leaves out ZERO entries as being even
  if ((SW1counter > 1) && (x==0)) {
     digitalWrite(motor1Pin, LOW);
    digitalWrite(motor2Pin, HIGH);
  }
  
  SW0val = digitalRead(inputDigitButton);
  if (SW0val != old_SW0val) {
    if ((SW0val == HIGH) && (digitalRead(switchPin) == LOW)) {
      SW0counter++;
      SW0state = 1- SW0state;
      delay (20);
    }
  }
    old_SW0val = SW0val;
    
    int y = SW0counter % 2;
    // if a remainder of 1 then odd
    if (y==1) {
      digitalWrite(motor5Pin, HIGH);
      digitalWrite(motor6Pin, LOW);
    }
    
    if ((SW0counter>1) && (y == 0)) {
      digitalWrite (motor5Pin, LOW);
      digitalWrite (motor6Pin, HIGH);
    }
    
    

  
//  Serial.print("SW1counter = ");
//   Serial.println(SW1counter);
//   Serial.print("SW1val = ");
//   Serial.println(SW1val);
//    Serial.print("x = ");
//   Serial.println(x);
//   
//    Serial.print("SW0counter = ");
//   Serial.println(SW0counter);
//   Serial.print("SW0val = ");
//   Serial.println(SW0val);
//    Serial.print("y = ");
//   Serial.println(y);


int m5pin = digitalRead(motor5Pin);
Serial.print("motor5Pin = ");
   Serial.println(m5pin);
   int m6pin = digitalRead(motor6Pin);
   Serial.print("motor6Pin = ");
   Serial.println(m6pin);
    Serial.print("y = ");
   Serial.println(y);
   int power = digitalRead(enablePin11);
   Serial.print ("enablePin11 = ");
   Serial.println(power);



}

/*
    blinks an LED
 */
void blink(int whatPin, int howManyTimes, int milliSecs) {
  int i = 0;
  for ( i = 0; i < howManyTimes; i++) {
    digitalWrite(whatPin, HIGH);
    delay(milliSecs/2);
    digitalWrite(whatPin, LOW);
    delay(milliSecs/2);
  }
}



