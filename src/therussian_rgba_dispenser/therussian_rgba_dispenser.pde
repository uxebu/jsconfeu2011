const double vol = 0.05;
const double lps = 0.015 / 1;

void setup() {                
  pinMode(9, OUTPUT);
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);
  
  Serial.begin(9600);
}

void loop() {
  if(Serial.available() >= 8){
    char rs[3];
    rs[0] = Serial.read();
    rs[1] = Serial.read();
    rs[2] = 0;
    char gs[3];
    gs[0] = Serial.read();
    gs[1] = Serial.read();
    gs[2] = 0;
    char bs[3];
    bs[0] = Serial.read();
    bs[1] = Serial.read();
    bs[2] = 0;
    char as[3];
    as[0] = Serial.read();
    as[1] = Serial.read();
    as[2] = 0;
  
    char** end;
    int ri = strtol(rs, end, 16);
    int gi = strtol(gs, end, 16);
    int bi = strtol(bs, end, 16);
    int ai = strtol(as, end, 16);

    double sum = ri + gi + bi + ai;
  
    double fac = 255.0 / sum;
  
    double ra = ri / 255.0 * fac * vol;
    double ga = gi / 255.0 * fac * vol;
    double ba = bi / 255.0 * fac * vol;
    double aa = ai / 255.0 * fac * vol;
  
    double rt = ra / lps * 1000;
    double gt = ga / lps * 1000;
    double bt = ba / lps * 1000;
    double at = aa / lps * 1000;
  
    Serial.println(rt, DEC);
    Serial.println(gt, DEC);
    Serial.println(bt, DEC);
    Serial.println(at, DEC);
  
    digitalWrite(9, HIGH);
    delay(rt);
    digitalWrite(9, LOW);
  
    digitalWrite(10, HIGH);
    delay(gt);
    digitalWrite(10, LOW);
  
    digitalWrite(11, HIGH);
    delay(bt);
    digitalWrite(11, LOW);
  
    digitalWrite(12, HIGH);
    delay(at);
    digitalWrite(12, LOW);
  
    delay(5000);
  }
}
