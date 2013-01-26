/* F_P_13 Controller by JaiTronik 2011.12 ITP
 
 The Circuit:
   10 Potentiometers:  
     8 Pots wired to a 4051B Single 8-Channel Analog Multiplexer (to pin 3)
     2 Pots wired Analog Pins 4,5
 
 Purpose:
   Provide a control mechanism for the PImage PatternLanguage
   Processing sketch
 */
//setup for automating  the digitalPin reading from 3,4,5
int firstAddressPin = 3;

int pot0 = 3; // multiplexer into Arduino on pin3
int pot0Val=0; // initial value for the top left potentiometer

int pot8 = 5;
int pot8Val = 0;
int pot9 = 4;
int pot9Val = 0;

void setup () {
  //start serial communication 
  Serial.begin (9600);
  
  //set the 3 output pins to read from the Multiplexer
  pinMode(3, OUTPUT);  // A
 pinMode(4, OUTPUT);  // B
  pinMode(5, OUTPUT);  // C

}
void loop() {
  //set the 3 digital pins to LOW to check Pot0 reading;
  digitalWrite(3,HIGH);
  digitalWrite(4,HIGH);
  digitalWrite(5,HIGH);
  
  //read the pots
  pot0Val = analogRead(pot0);
  pot8Val = analogRead(pot8);
  pot9Val = analogRead(pot9);
  
  //send sensor value through serial to computer
  Serial.print("pot0Val = ");
  Serial.print(pot0Val);
  Serial.print(" pot8Val = ");
  Serial.print(pot8Val);
  Serial.print(" pot9Val = ");
  Serial.println(pot9Val);
  
  //delay just in case thngs are crazy
  delay(10);
  
}

