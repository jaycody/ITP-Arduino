// Pulse Width Modulation Kung FU
// Jai.Tronik
// Winter Break Jan 2011
// Orchard St Day # 17


#define LED1  11
#define LED2  10
#define LED3  9
#define LED4  6
#define LED5  5
#define LED6  3

// LED Brightness Variables for PWM
float L1B = 0;  // LED 1 Brightness
float L2B = 0;
float L3B = 0;
float fade = 1;  // initial increment of velocity:  5/cycle
float gravity = .5;  //  amount of increase in velocity per cycle (ex velocity + .o5, (velocity+.05)+(velocity+.05) + .05
float dampen = - 1.05;  //  this will change direction AND add .1 (ex: invert velocity by 100%, then increase by .1%

void setup (){
  
  // Set Pin Modes for LEDS
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);
  pinMode(LED5, OUTPUT);
  pinMode(LED6, OUTPUT);
  
  // Troubleshooting
Serial.begin(9600);
  
}

void loop(){
  
  
  analogWrite(LED1, L1B);
  analogWrite(LED2, L1B);
  analogWrite(LED3, L1B);
  analogWrite(LED4, L1B);
  analogWrite(LED5, L1B);
  analogWrite(LED6, L1B);
  
  L1B = L1B + fade;
  //fade = fade + gravity;
  
  if ((L1B < 3) || (L1B > 255)){
    fade = -fade;
  }
  if (L1B > 255){
    L1B = 255;
  }
  if (L1B < 3){
    L1B = 3;
  }
  
  //  Troubleshooting
   Serial.print("L1B = ");
  Serial.print(L1B);
  Serial.print("  fade = ");
  Serial.println(fade);

}

