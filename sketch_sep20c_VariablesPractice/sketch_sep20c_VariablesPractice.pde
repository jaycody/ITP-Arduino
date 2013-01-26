// Jason Stephens
// Physical Computing
// Lab 2a:  Variables_practice
// ITP - Fall 2010

// Turning It Up to 11

// declare global variables
#define suzan 9 // gives pin 13 the name "suzan"

// create the program block "setup"
void setup()
{
  pinMode(suzan, OUTPUT); //  sets the mode of the pin "suzan" to either I/O
}


// create the program block for looping.  from the void comes the LOOP
void loop()
{
  digitalWrite(suzan, HIGH); // this is a command telling pin #13 (aka suzan) to go HIGH
  delay(1000);  // establishes a delay in miliseconds
  digitalWrite(suzan, LOW); // this is a command telling pin #13 (aka suzan) to turn off
  delay(1000); // another one second delay
}

