const int outpin = 1;
const int pin1 = 2;
const int pin2 = 3;
const int pin3 = 4;
const int pin4 = 5;
int reset = 6;
int start = 7;
int tijd1;
int tijd2;
int tijd3;
int tijd4;

int output = 9;
void setup() {
  Serial.begin(9600);
}

void loop()
{
  //pulse maken
  long duration, inches, cm;
  pinMode(outpin, OUTPUT);
  digitalWrite(outpin, LOW);
  delayMicroseconds(2);
  digitalWrite(outpin, HIGH);
  delayMicroseconds(5);
  digitalWrite(outpin, LOW);
  
  
  pinMode(pin1, INPUT);
  pinMode(pin2, INPUT);
  pinMode(pin3, INPUT);
  pinMode(pin4, INPUT);
  pinMode(reset, INPUT);
  pinMode(start, INPUT);
  pinMode(output, OUTPUT);
  
  tijd1 = pulseIn(pin1,HIGH);
  tijd2 = pulseIn(pin2,HIGH);
  tijd3 = pulseIn(pin3,HIGH);
  tijd4 = pulseIn(pin4,HIGH);
  
   tijd1 =tijd1 / 74 / 2;
    tijd2 =tijd2 / 74 / 2;
     tijd3 =tijd3 / 74 / 2;
      tijd4 =tijd4 / 74 / 2;
      
     tijd1 = map(tijd1,0,50,0,12);
     tijd2 = map(tijd2,0,50,12,0);
     tijd3 = map(tijd3,0,50,0,12);
     tijd4 = map(tijd4,0,50,12,0);
      
      if(tijd1 == tijd2 && tijd3 == tijd4)
      {
       output = byte(tijd1) + byte(tijd3);
      }
      else if(reset = 1)
      {
       output = 11111111; 
      }
      else if(start = 1)
      {
       output = 11011101;
      }
}
