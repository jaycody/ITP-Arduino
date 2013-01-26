//  For Loop Kung Fu
//  Jai.Tronik
//  Winter Break Jan 2011

int duration (200);

void setup(){

  // INITIALIZE the (contiguous) digital pins using a for loop

    for (int LED = 3; LED <=8; LED++)
  {
    pinMode (LED, OUTPUT);
  } // end of loop
  
  // troubleshooting
Serial.begin(9600);

}  //end setup


void loop(){
  
  // blink in assending order
  for (int i = 3; i <=7; i++)  // BLINK these
  {
    digitalWrite(i, HIGH);
    delay(duration);
    digitalWrite(i, LOW);
    delay(duration);
  }
  
  // Blink in descending order
  for (int i = 8; i>=4; i--){
    digitalWrite(i, HIGH);
    delay(duration);
    digitalWrite(i, LOW);
    delay(duration);
    
}
duration = duration -25;
if (duration < 0){
  //duration = 25;
  duration = duration * -1;
}
Serial.print("duration = ");
Serial.println(duration);
}



