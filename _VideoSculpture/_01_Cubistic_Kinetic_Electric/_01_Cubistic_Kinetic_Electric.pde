/*jason stephens
 
 Cubistic Futuristic Kinectic Electric Light Art Thingy
 video sculpture - fall 2011
 ITP - NYU
 
 Mutated from example "Blink without Delay"
   created 2005
   by David A. Mellis
   modified 8 Feb 2010
   by Paul Stoffregen
   http://www.arduino.cc/en/Tutorial/BlinkWithoutDelay
 
 METHOD:
 Adjusts on and off intervals of a Relay connected to a digital  
 pin, without using the delay() function.  This means that other code
 can run at the same time without being interrupted. 
 Check to see if it's time to flip the Relay. If the 
 difference between the current time and last time the Relay
 flipped is bigger than the interval, then the Relay flips back.
 
 THE CIRCUIT:
 * Relay1 attached from pin 3.
 * TestLed1 attached from pin3
 
 * Pot1 (Center Pin) attached to Analog Pin 0
 * Pot2 (Center Pin) attached to Anolog Pin 1
 
 */

// Light #1
int pot1Pin = A0;
int Relay1Pin =  3;      // the number of the Relay
int pot1Value = 0;
int Relay1State = LOW; // RelayState used to set the Relay LOW
long previousMillis = 0;        // will store last time Relay was updated
long interval = 1000;           // interval at which to blink (milliseconds)

//Light2
int pot2Pin = A1;
int Relay2Pin = 4;
int pot2Value =0;
int Relay2State = LOW;
long previousMillis2 = 0;  //  will store last time Relay2 was updated
long interval2= 1000;  // Interval2 will determine the blink duration of second relay

//Light3
int pot3Pin = A2;
int Relay3Pin = 5;
int pot3Value =0;
int Relay3State = LOW;
long previousMillis3 = 0;  //  will store last time Relay2 was updated
long interval3= 1000;  // Interval2 will determine the blink duration of second relay

int longest = 2000; // duration of maximum delay

void setup() {
  Serial.begin(9600); // open the com link with NeoTron
  
  // set the digital pin as output:
  pinMode(Relay1Pin, OUTPUT);
  pinMode(Relay2Pin, OUTPUT);
 pinMode(Relay3Pin, OUTPUT); 
}

void loop(){

  controlLight1();
  controlLight2();
  controlLight3();
  serialPrint();
}

void controlLight1(){
 
  pot1Value =analogRead(pot1Pin);

  interval = map(pot1Value, 0, 850, 1, longest);

  unsigned long currentMillis = millis();

  if(currentMillis - previousMillis > interval) {
    // save the last time you blinked the LED 
    previousMillis = currentMillis;   

    // if the LED is off turn it on and vice-versa:
    if (Relay1State == LOW)
      Relay1State = HIGH;
    else
      Relay1State = LOW;

    // set the LED with the ledState of the variable:
    digitalWrite(Relay1Pin, Relay1State);
  }
 
}
void controlLight2 () {
   pot2Value =analogRead(pot2Pin);

  interval2 = map(pot2Value, 0, 850, 1, longest);

  unsigned long currentMillis2 = millis();

  if(currentMillis2 - previousMillis2 > interval2) {
    // save the last time you blinked the LED 
    previousMillis2 = currentMillis2;   

    // if the LED is off turn it on and vice-versa:
    if (Relay2State == LOW)
      Relay2State = HIGH;
    else
      Relay2State = LOW;

    // set the LED with the ledState of the variable:
    digitalWrite(Relay2Pin, Relay2State);
  }
  
}

void controlLight3 () {
   pot3Value =analogRead(pot3Pin);

  interval3 = map(pot3Value, 0, 850, 1, longest);

  unsigned long currentMillis3 = millis();

  if(currentMillis3 - previousMillis3 > interval3) {
    // save the last time you blinked the LED 
    previousMillis3 = currentMillis3;   

    // if the LED is off turn it on and vice-versa:
    if (Relay3State == LOW)
      Relay3State = HIGH;
    else
      Relay3State = LOW;

    // set the LED with the ledState of the variable:
    digitalWrite(Relay3Pin, Relay3State);
  }
  
}
void serialPrint () {
  //Light#1
   Serial.print("pot1Val = ");
  Serial.print(pot1Value);
  Serial.print(", interval = ");
  Serial.print(interval); 
  
  //Light#2
 Serial.print(" | pot2Val = ");
  Serial.print(pot2Value);
  Serial.print(", interval2 = ");
  Serial.print(interval2); 
  
  //Light#3
   //Light#2
 Serial.print(" | pot3Val = ");
  Serial.print(pot3Value);
  Serial.print(", interval3 = ");
  Serial.println(interval3); 
}


