//Jason Stephens
//Winter Break 2010-2011
//on the floor at 166 Orchard St
// experiment with PWM and multiple switches.

int LED1 = 8;
int LED2 = 2;
int LED3 = 3;
int sw1 = 4;
int sw2 = 5;
int sw3 = 6;


int LED4 = 9;
int LED5 = 10;
int LED6 = 11;

void setup(){
  Serial.begin(9600);
  pinMode(8, OUTPUT);
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(4, INPUT);
  pinMode(5, INPUT);
  pinMode(6, INPUT);
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
}

void loop(){
  digitalWrite (LED1, HIGH);
  digitalWrite (LED2, HIGH);
  digitalWrite (LED3, HIGH);

  analogWrite (LED4, 1023);
  analogWrite (LED5, 1023);
  analogWrite (LED6, 1023);
  
  delay(15);

}



