/* jason stephens
 Fashion Tech - Fall 2011
 Divination Augmentation
 
 Idea:  
 Receive yes/no bit responses to yes/no questions.
 
 Method:
 Use two LEDs attached to the shoulders of a suit.  both on = yes.  Left on = no.  r = dont know.
 
 Setup:
 Lilypad attached to inside pocket of sport coat.  One LED to Pin9, One LED to Pin16
 Adapted from
 Fade
 This example shows how to fade an LED on pin 9
 using the analogWrite() function.
 This example code is in the public domain.
 
 */

int LED1Pin = 9;
int LED2Pin =10;
int Button1 = 11;


int LED1state = 1;
int LED2state = 1; 

// Button Variables
int ButtonCounter = 0;
int Button1state = 0;
int LastButtonState = 0;

// Debounce time
long lastDebounceTime = 0;
long debounceDelay = 50;

// FADE variables
int brightness = 0;
int fadeAmount = 10;

void setup()  { 
  // declare pin 9 to be an output:
  pinMode(LED1Pin, OUTPUT);
  pinMode(LED2Pin, OUTPUT);
  pinMode(Button1, INPUT);
} 

void loop()  { 
  Serial.begin (9600);

  Button1stateChange();

  resetCounter ();

  stateAction();

  serialPrint();
}


void Button1stateChange() {
  //read the Switch at input pin
  //add a "reading variable"  and measure it's time before assigning it Button1State
  int reading = digitalRead(Button1);
  //DEBOUNCE
  //compare the just read Button state to its previous state
  if (reading != LastButtonState) {
    //reset the debounce time
    lastDebounceTime = millis();
  }
  //if the delay criteria is met, then we believe it is an actual button push
  if ((millis()- lastDebounceTime ) > debounceDelay) {
    Button1state = reading;
  }
  // DETECT STATE CHANGE
  if (Button1state  != LastButtonState){
    if (Button1state == HIGH) {
      ButtonCounter++;
    }
  }
  //save the current state as the last state
  LastButtonState = reading;
}


void resetCounter(){
  if (ButtonCounter % 4 == 0){
    ButtonCounter = 0;
  }
}


void stateAction (){
  if (ButtonCounter == 0) {
    digitalWrite (LED1Pin, HIGH);
    digitalWrite (LED2Pin, HIGH);
    Serial.print (" LED1 = 1");
    Serial.println (" LED2 = 1");
  }

  if (ButtonCounter == 1) {
    // if we create variable inside the loop, then they stay there...
    LED1state = random(2);  //these local variable stay within the loop
    LED2state = random(2);
    digitalWrite (LED1Pin, LED1state);
    digitalWrite (LED2Pin, LED2state);
    Serial.print (" LED1 = ");
    Serial.print (LED1state);
    Serial.print (" LED2 = ");
    Serial.println (LED2state);
  }   

  //at the count of 2, freeze random states, unless Double Zero, in which case, make both HIGH
  if (ButtonCounter == 2) {
    if ((LED1state == 0) && (LED2state == 0)) {
      LED1state=1;
      LED2state=1;
    }
    digitalWrite (LED1Pin, LED1state);
    digitalWrite (LED2Pin, LED2state);
    Serial.print (" LED1 = ");
    Serial.print (LED1state);
    Serial.print (" LED2 = ");
    Serial.println (LED2state);
  }

  //or brightness shift
  if (ButtonCounter == 3) {

    // set the brightness of pin 9:
    analogWrite(LED1Pin, brightness);   
    analogWrite(LED2Pin, brightness);    

    // change the brightness for next time through the loop:
    brightness = brightness + fadeAmount;

    // reverse the direction of the fading at the ends of the fade: 
    if (brightness == 0 || brightness == 255) {
      fadeAmount = -fadeAmount ; 
    }     

    Serial.print (" LED1 = FADE");

    Serial.println (" LED2 = FADE");

    // wait for 30 milliseconds to see the dimming effect    
    //delay(30);                            
  }

}

void serialPrint () {
  Serial.print("number of pushes:  ");
  Serial.print(ButtonCounter, DEC);
  //write it out

}

















