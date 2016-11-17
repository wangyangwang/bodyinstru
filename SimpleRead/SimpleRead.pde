import processing.sound.*;
import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port
SoundFile soundfile;

void setup() 
{
  size(200, 200);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  String portName = Serial.list()[5];
  myPort = new Serial(this, portName, 9600);
  soundfile = new SoundFile(this, "148580__neatonk__piano-med-ab7.wav");
}

void draw()
{

  if ( myPort.available() > 0) {  // If data is available,
    val = myPort.read();         // read it and store it in val
  }

  println(val);
  if (val < 100) {
    soundfile.play();
  }
}





/*

 // Wiring / Arduino Code
 // Code for sensing a switch status and writing the value to the serial port.
 
 int switchPin = 4;                       // Switch connected to pin 4
 
 void setup() {
 pinMode(switchPin, INPUT);             // Set pin 0 as an input
 Serial.begin(9600);                    // Start serial communication at 9600 bps
 }
 
 void loop() {
 if (digitalRead(switchPin) == HIGH) {  // If switch is ON,
 Serial.write(1);               // send 1 to Processing
 } else {                               // If the switch is not ON,
 Serial.write(0);               // send 0 to Processing
 }
 delay(100);                            // Wait 100 milliseconds
 }
 
 */