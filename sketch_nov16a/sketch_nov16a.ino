void setup() {
  // put your setup code here, to run once:
    Serial.begin(9600); // opens serial port, sets data rate to 9600 bps

}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.write(analogRead(A0));
  delay(50);
}
