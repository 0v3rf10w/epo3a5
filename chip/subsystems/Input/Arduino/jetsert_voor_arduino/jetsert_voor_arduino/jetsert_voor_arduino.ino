#include <SPI.h>
int reset = 12;
int ss = 13;

int keer = A4;
int plus = A6;
int mini = A5;

int leftbuttonplayer1pin = A1;
int rightbuttonplayer1pin = A0;
int leftbuttonplayer2pin = A3;
int rightbuttonplayer2pin = A2;

int plaatsplayer1 = 6;
int plaatsplayer2 = 6;
int slavepin = 13;

int a,plusbutton,keerbutton,minbutton,leftbuttonplayer2,leftbuttonplayer1,rightbuttonplayer1,rightbuttonplayer2,sumplayer1;
void setup() {
  Serial.begin(9600);
  SPI.begin();
  pinMode(keer,INPUT);
  pinMode(plus,INPUT);
  pinMode(mini,INPUT);
  pinMode(leftbuttonplayer2pin, INPUT); // links player 1
  pinMode(leftbuttonplayer1pin, INPUT);
  pinMode(rightbuttonplayer2pin, INPUT);
  pinMode(rightbuttonplayer1pin, INPUT);
  pinMode(ss, OUTPUT);
  pinMode(reset, OUTPUT);
}

void loop()
{
  leftbuttonplayer1 = analogRead(leftbuttonplayer1pin);
  rightbuttonplayer1 = analogRead(rightbuttonplayer1pin);
  leftbuttonplayer2 = analogRead(leftbuttonplayer2pin);
  rightbuttonplayer2 = analogRead(rightbuttonplayer2pin);

  plusbutton = analogRead(plus);
  keerbutton = analogRead(keer);
  minbutton = analogRead(mini);
  if(leftbuttonplayer1 == 1023)
  {
    plaatsplayer1 -= 1;
  }
  if(rightbuttonplayer1 == 1023)
  {
    plaatsplayer1 += 1;
  }
  if(leftbuttonplayer2 == 1023)
  {
    plaatsplayer2 -= 1;
  }
  if(rightbuttonplayer2 == 1023)
  {
    plaatsplayer2 += 1;
  }

  if(plaatsplayer1 > 12)
  {
    plaatsplayer1 = 12; 
  }
  if(plaatsplayer2 > 12)
  {
    plaatsplayer2 = 12;
  }
  if(plaatsplayer1 < 0)
  {
    plaatsplayer1 = 0;
  }
  if(plaatsplayer2 < 0)
  {
    plaatsplayer2 = 0;
  }
  if(plusbutton == 1023)
  {
    a=1;
    digitalWrite(reset,HIGH);
    delay(1);
    digitalWrite(reset,LOW);
    digitalWrite(ss,LOW);
    delay(1);
    SPI.transfer(208);
    digitalWrite(ss,HIGH);
    delay(100);
    digitalWrite(ss,LOW);
    delay(1000);
    byte test;
    test = byte(plaatsplayer1);
    test = test << 4;
    test = test | plaatsplayer2;
    SPI.transfer(test);
    digitalWrite(ss,HIGH);
    Serial.println("Plus");
    delay(500);
  } 
  if(keerbutton == 1023)
  {
    a=1;
    digitalWrite(reset,HIGH);
    delay(1);
    digitalWrite(reset,LOW);
    digitalWrite(ss,LOW);
    delay(1);

    SPI.transfer(240);
    digitalWrite(ss,HIGH);
    delay(100);
    digitalWrite(ss,LOW);
    delay(1500);
    byte test;
    test = byte(plaatsplayer1);
    test = test << 4;
    test = test | plaatsplayer2;
    SPI.transfer(test);
    digitalWrite(ss,HIGH);
    Serial.println("Keer");
    delay(500);
  }
  if(minbutton == 1023)
  {
    a=1;
    digitalWrite(reset,HIGH);
    delay(1);
    digitalWrite(reset,LOW);
    digitalWrite(ss,LOW);
    delay(1);

    SPI.transfer(224);
    digitalWrite(ss,HIGH);
    delay(100);
    digitalWrite(ss,LOW);
    delay(1000);
    byte test;
    test = byte(plaatsplayer1);
    test = test << 4;
    test = test | plaatsplayer2;
    SPI.transfer(test);
    digitalWrite(ss,HIGH);
    Serial.println("Min");
    delay(500);
  }
  Serial.print("Value 1: ");
  Serial.print(plaatsplayer1);
  Serial.print("  Value 2: ");
  Serial.print(plaatsplayer2);
  Serial.println();
  delay(100);
  a++;
}







