// Jaiku configuration with 3 toggles buttons

// NAME EACH PIN
#define LED1 3
#define LED2 5
#define LED3 6

#define SW1 4
#define SW2 2
#define SW3 7

// CREATE VARIABLES

// TIME Variables
long p_time = 0;  //previous time
unsigned long time = 0;  //current time, to be used with the millis() function
long duration;  //variable for different durations of blink

// SW1 Variables
int SW1val = 0; //used to store the value of SW1
int old_SW1val = 0;  // used to store the previous value of SW1, so that the looping program doesn't keep reseting the SW1 state.
int SW1state = 0;  // 0= LED1 off | 1 = LED1 on
int SW1counter = 0;

// SW2 Variables
int SW2val = 0; //used to store the value of SW1
int old_SW2val = 0;  // used to store the previous value of SW1, so that the looping program doesn't keep reseting the SW1 state.
int SW2state = 0;  // 0= LED1 off | 1 = LED1 on
int SW2counter = 0;

// SW2 Variables
int SW3val = 0; //used to store the value of SW1
int old_SW3val = 0;  // used to store the previous value of SW1, so that the looping program doesn't keep reseting the SW1 state.
int SW3state = 0;  // 0= LED1 off | 1 = LED1 on
int SW3counter = 0;

// LED State Variables
int L1;
int L2;
int L3;

// LED Brightness Variables for PWM
float L1B = 0;  // LED 1 Brightness
float L2B = 0;
float L3B = 0;
float fadeAmount = 4;  // initial increment of velocity:  5/cycle
float gravity = .5;  //  amount of increase in velocity per cycle (ex velocity + .o5, (velocity+.05)+(velocity+.05) + .05
float dampen = - 1.05;  //  this will change direction AND add .1 (ex: invert velocity by 100%, then increase by .1%

void setup(){
  // LED pinMode setup
  pinMode (LED1, OUTPUT);
  pinMode (LED2, OUTPUT);
  pinMode (LED3, OUTPUT);

  // SW pinMode setup
  pinMode (SW1, INPUT);
  pinMode (SW2, INPUT);
  pinMode (SW3, INPUT);

  //troubleshooting
  Serial.begin(9600);
}

void loop (){

  //Begin TIME:  Return current value of Arduino's run time and save it as a variable
  time = millis();  //this function returns the duration since the program starting running



  // Detect State Change of SW1
  SW1val = digitalRead(SW1); //  RETURN VALUE of SW1.  SW1val is used to store the result of digital read
  if (SW1val != old_SW1val){  //if incoming value is NOT equal to the old value, then do of each
    // nested if statements
    if (SW1val == HIGH){
      SW1counter++;  //If Switch is High, add 1 to counter
      SW1state = 1 - SW1state;
      delay(20);
    }
    if (SW1val == LOW){
      SW1counter++;
      SW1state = 1 - SW1state;
      delay(20);
    }
  }
   // STORE SW1 Values as Previous SW Value:  Iterate Switch History.
  old_SW1val = SW1val;

  // RESET SW1 Counters Back to 0 if they go beyond 10
  if (SW1counter > 10){
    SW1counter = 0;
  }


  // Detect State Change of SW2
  SW2val = digitalRead(SW2); //RETURN VALUE of SW2.  SW2val is used to store the result of digital read
  if (SW2val != old_SW2val){  //if incoming value is NOT equal to the old value, then do of each
    // nested if statements
    if (SW2val == HIGH){
      SW2counter++;  //If Switch is High, add 1 to counter
      SW2state = 1 - SW2state;
      delay(20);
    }
    if (SW2val == LOW){
      SW2counter++;
      SW2state = 1 - SW2state;
      delay(20);
    }
  }
   // STORE SW1 Values as Previous SW Value:  Iterate Switch History.
  old_SW2val = SW2val;

  // RESET SW1 Counters Back to 0 if they go beyond 10
  if (SW2counter > 10){
    SW2counter = 0;
  }


  // Detect State Change of SW3
  SW3val = digitalRead(SW3); //RETURN VALUE of SW3.  SW3val is used to store the result of digital read
  if (SW3val != old_SW3val){  //if incoming value is NOT equal to the old value, then do of each
    // nested if statements
    if (SW3val == HIGH){
      SW3counter++;  //If Switch is High, add 1 to counter
      SW3state = 1 - SW3state;
      delay(20);
    }
    if (SW3val == LOW){
      SW3counter++;
      SW3state = 1 - SW3state;
      delay(20);
    }
  }
   // STORE SW3 Values as Previous SW Value:  Iterate Switch History.
  old_SW3val = SW3val;

  // RESET SW3 Counters Back to 0 if they go beyond 10
  if (SW3counter > 10){
    SW3counter = 0;
  }


  // CONDITIONALS:  (SW1 Counter)

  if (SW1counter == 2){
    SW1counter2();
  }

  if (SW1counter == 5){
    SW1counter5();
  }
  if (SW1counter == 6){
    SW1counter6();
  }
  if (SW1counter == 7){
    SW1counter7();
  }

  // troubleshooting
  //Serial.print("SW1val = ");
  //Serial.print(SW1val);
  //Serial.print("   old_SW1val = ");
  //Serial.print(old_SW1val);
  //Serial.print("   SW1state = ");
  //Serial.print(SW1state);
  //Serial.print("   TIME = ");
  //Serial.print(time);
  //Serial.print("   P_Time = ");
  //Serial.print(p_time);
  Serial.print("   SW1counter = ");
  Serial.print(SW1counter);
  Serial.print("   SW2counter = ");
  Serial.print(SW2counter);
  Serial.print("   SW3counter = ");
  Serial.print(SW3counter);
  Serial.print("   L1 = ");
  Serial.print(L1);
  Serial.print("   L1B = ");
  Serial.print(L1B);
  Serial.print("  fadeAmount = ");
  Serial.println(fadeAmount);

}

// FUNCTIONS: (Switch Counters)
void SW1counter2(){  // PWM Fading
  // Initialize Variables

  // Set Brightness of LED1
  analogWrite (LED1, L1B);
  analogWrite (LED2, L1B);
  analogWrite (LED3, L1B);

  // Change Brightness by fadeAmount for next loop cycle
  L1B = L1B + fadeAmount;              // increases brightness
  fadeAmount = fadeAmount + gravity;  // increases fadeAmount, which accelerates brightness

  // Reverse Direction of Brightness at ZERO or 255
  if (L1B < 5 || L1B > 255) {
    fadeAmount = fadeAmount * dampen;
  }
  if (L1B < 5) {    //this will constrain the brightness so we don't have -15 to LED
    L1B = 5;
  }
  //  
  if (L1B > 255) {  // constrains results 
    L1B = 255;
  }
  if (fadeAmount > 200000){
    fadeAmount = 4;
  }
  //delay (30);
}

void SW1counter5(){  //blinking without delay  (NOTE:  This took HOURS to figure out)
  // Variables
  time = millis ();
  duration = 1000; // Setup the Time Lapse Duration
  // CONDITIONAL:  (Time Lapse)
  if (time - p_time > duration){
    p_time = time;
    if (L1 == LOW){
      L1 = HIGH;
    }
    else{
      L1 = LOW;
    }
    digitalWrite(LED1, L1);
    digitalWrite(LED2, L1);
    digitalWrite(LED3, L1);
    delay(10);
  }
}

void SW1counter6(){
  digitalWrite (LED3, HIGH);
  delay(100);
  digitalWrite (LED2, HIGH);
  delay(100);
  digitalWrite (LED1, HIGH);
  delay(100);
  digitalWrite (LED3, LOW);
  delay(100);
  digitalWrite (LED2, LOW);
  delay(100);
  digitalWrite (LED1, LOW);
  delay(100); 
}
void SW1counter7(){
  int delayX;
  int L;
  delayX = random(300);
  Serial.println(delayX);
  digitalWrite (LED1, HIGH);
  delay(delayX);
  digitalWrite (LED2, HIGH);
  delayX = random(300);
  delay(delayX);
  digitalWrite (LED3, HIGH);
  delayX = random(300);
  delay(delayX);
  digitalWrite (LED1, LOW);
  delayX = random(300);
  delay(delayX);
  digitalWrite (LED2, LOW);
  delayX = random(300);
  delay(delayX);
  digitalWrite (LED3, LOW);
  delayX = random(300);
  delay(delayX); 
}

















