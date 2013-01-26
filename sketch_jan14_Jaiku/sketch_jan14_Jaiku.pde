#define LED1 3
#define LED2 5
#define LED3 6

#define SW1 4

int SW1val = 0; //used to store the value of SW1
int old_SW1val = 0;  // used to store the previous value of SW1, so that the looping program doesn't keep reseting the SW1 state.
int SW1state = 0;  // 0= LED1 off | 1 = LED1 on

void setup(){
  // LED pinMode setup
  pinMode (LED1, OUTPUT);
  pinMode (LED2, OUTPUT);
  pinMode (LED3, OUTPUT);
  
  // SW pinMode setup
  pinMode (SW1, INPUT);
  
  //troubleshooting
  Serial.begin(9600);
}

void loop (){
  
  //read input value of switch 1 and store it as SW1val
  SW1val = digitalRead(SW1); //SW1val is used to store the result of digital read
  
  // 1st - CHECK FOR TRANSITIONwith the value returned on the digitalRead
  if ((SW1val == HIGH ) && (old_SW1val == LOW)) {  // in other words "if it's ON after being LOW"
  SW1state = 1 - SW1state;
  delay(10);  //if conditions are met and a state change occurs, then also delay long enough for change to happen.
  }
  
  // Now turn the SW val into the previous SW val, since it was used in the previous conditional
  // So, the condition is met, the command inside the for loop is executed, program moves on, lets put a place holder
  // right here so that we know what the value of thw switch was last time we passed this way.
  // When program loops again, it will compare current digitalRead with previous digitalRead, and will only take action
  // if the new constraining condition is met, which is:  if current is ON and previous was OFF   THEN execute.
  old_SW1val = SW1val;
  
  // troubleshooting
  Serial.print("SW1val = ");
  Serial.print(SW1val);
  Serial.print("   old_SW1val = ");
  Serial.print(old_SW1val);
  Serial.print("   SW1state = ");
  Serial.println(SW1state);
  
  
  
  // This comment is an older iteration of the conditional statement.  doesn't constrain the options if it's HIGH and it was LOW
  //if (SW1val == HIGH){
  //  SW1state = 1 - SW1state;  //the TRICK:  1-0=1  and   1-1=0
  //}
  

  //now ask what the value of sw1 is and take action with IF statement
  //if (SW1val == HIGH){  // conditional statement based on the direct digitalRead of SW1 saved as SW1val.
  if (SW1state == 1){  //conditional statement based on SW1 state, which is determined by the previous conditional based on digtialRead
    digitalWrite (LED1, HIGH); //turn LED1 on
    digitalWrite (LED2, HIGH); //turn LED2 on
    digitalWrite (LED3, HIGH); //turn LED3 on    
  }
  else {
    digitalWrite (LED1, LOW);  //turn OFF LED1 for any reason other than SW1 HIGH
    digitalWrite (LED2, LOW);  //turn OFF LED1 for any reason other than SW1 HIGH
    digitalWrite (LED3, LOW);  //turn OFF LED1 for any reason other than SW1 HIGH
  }
}

