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

  //Loop through all OUTPUT PINS from 3-4, set as OUTPUT, set as LOW
  for (int pinNumber = firstAddressPin; pinNumber < firstAddressPin + 3 ; pinNumber++) {
    pinMode (pinNumber, OUTPUT);
    digitalWrite(pinNumber, LOW);  
  }

  //TESTING THE DIGITAL PINS: the 3 output pins from Arduino to Switch Multiplexer
  //pinMode(3, OUTPUT);  // A
  //pinMode(4, OUTPUT);  // B
  //pinMode(5, OUTPUT);  // C
}

void loop() {
  
  //read Pots 8 and 9 sepearate from the multiplexer
   pot8Val = analogRead(pot8);
  pot9Val = analogRead(pot9);

  //Loop through all 8 of the incoming signals from the Multiplexer
  for (int thisChannel = 0; thisChannel < 8 ; thisChannel ++) {
    setChannel (thisChannel);  // A method that does something, I'm not sure of

    //read the analog input from the Arduino Analog In Pin 3 and store it in variable 
    int analogReading = analogRead (3);

    // now print it
    Serial.print (thisChannel, DEC);
    Serial.print (" = ");
    Serial.print (analogReading, DEC);
    Serial.print ("\t");  // line feed or something or other??
  }
  //print a linefeed and carriage return once for loop cycles through
  Serial.print(" 8 = ");
  Serial.print(pot8Val, DEC);
  Serial.print ("\t"); //prints a tab!!!
  Serial.print(" 9 = ");
  Serial.print(pot9Val, DEC);
  Serial.println();
}

/* create the "setChannel" method to set the Multiplexers Binary Address Pins.
 This determines which Potentiometer is read
 */
void setChannel(int whichChannel) {
  for (int bitPosition = 0; bitPosition < 4; bitPosition++) {
    // shift value x bits to the right, and mask all but bit 0:
    int bitValue = (whichChannel >> bitPosition) & 1;
    // set the address pins:
    int pinNumber = firstAddressPin + bitPosition;
    digitalWrite(pinNumber, bitValue);
  }
}






