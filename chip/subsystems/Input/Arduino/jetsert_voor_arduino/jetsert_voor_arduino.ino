const int outpin = 7;
#include <SPI.h>
int tijd1,tijd3;
int slavepin = 10;
int output = 7;
int buttonpin1 = 10;
int buttonpin2 = 11;
int leftbuttonplayer1pin = A2;
int leftbuttonplayer2pin = A3;
int rightbuttonplayer1pin = A4;
int rightbuttonplayer2pin = A5;
int pin1 = 7;
int pin3 = A1;
int plaatsplayer1 = 6;
int plaatsplayer2 = 6;
int button1,button2,leftbuttonplayer2,leftbuttonplayer1,rightbuttonplayer1,rightbuttonplayer2,sumplayer1;
void setup() {
  Serial.begin(9600);
  SPI.begin();
   pinMode(buttonpin1, INPUT); // player 1 buttons of niet
  pinMode(buttonpin2, INPUT); // player 2 buttons of niet
  pinMode(leftbuttonplayer2pin, INPUT); // links player 1
  pinMode(leftbuttonplayer1pin, INPUT);
  pinMode(rightbuttonplayer2pin, INPUT);
  pinMode(rightbuttonplayer1pin, INPUT);
}

void loop()
{
  long duration, inches, cm; //pulse make
  button1 = 1;//digitalRead(buttonpin1);
  button2 = 0;//digitalRead(buttonpin2);
  pinMode(outpin, OUTPUT);
  digitalWrite(outpin, LOW);
  delayMicroseconds(2);
  digitalWrite(outpin, HIGH);
  delayMicroseconds(5);
  digitalWrite(outpin, LOW);

  if(button1 == 1)
  {
    if(button2 == 1)
    {
      pinMode(pin1,INPUT);
          pinMode(pin3,INPUT);
      tijd1 = pulseIn(pin1,HIGH);
      tijd3 = pulseIn(pin3,HIGH);

      tijd1 =tijd1 / 29 / 2;
      tijd3 =tijd3 / 29 / 2;

      plaatsplayer1 = map(tijd1,0,50,0,12);
     plaatsplayer2 = map(tijd3,0,50,0,12);
    }
    else
    {
      pinMode(pin1,INPUT);
      tijd1 = pulseIn(pin1,HIGH);
      tijd1 =tijd1 / 29 / 2;
      plaatsplayer1 = map(tijd1,0,75,0,12);
      
      leftbuttonplayer2 = digitalRead(leftbuttonplayer2pin);
      rightbuttonplayer2 = digitalRead(rightbuttonplayer2pin);

      if(leftbuttonplayer2 = 1)
      {
        plaatsplayer2 = plaatsplayer2 + 1;
      }
      else if(rightbuttonplayer2 = 1)
      {
        plaatsplayer2 = plaatsplayer2 - 1;
      }
      else
      {
        plaatsplayer2 = plaatsplayer2;
      }
    }
  }
  else
  {
    if(button2 == 1)
    {
      tijd3 = pulseIn(pin1,HIGH);
      tijd3 =tijd1 / 29 / 2;
      plaatsplayer2 = map(tijd3,0,50,0,12);
      
      leftbuttonplayer1 = digitalRead(leftbuttonplayer1pin);
      rightbuttonplayer2 = digitalRead(rightbuttonplayer1pin);
      leftbuttonplayer2 = digitalRead(leftbuttonplayer2pin);
      rightbuttonplayer2 = digitalRead(rightbuttonplayer2pin);

      if(leftbuttonplayer1 = 1)
      {
        plaatsplayer1 = plaatsplayer1 + 1;
      }
      else if(rightbuttonplayer1 = 1)
      {
        plaatsplayer1 = plaatsplayer1 - 1;
      }
      else
      {
        plaatsplayer1 = plaatsplayer1;
      } 
    }
    else
    {
      leftbuttonplayer1 = digitalRead(leftbuttonplayer1pin);
      rightbuttonplayer2 = digitalRead(rightbuttonplayer1pin);
      if(leftbuttonplayer1 = 1)
      {
        plaatsplayer1 = plaatsplayer1 + 1;
      }
      else if(rightbuttonplayer1 = 1)
      {
        plaatsplayer1 = plaatsplayer1 - 1;
      }
      else
      {
        plaatsplayer1 = plaatsplayer1;
      } 
      if(leftbuttonplayer2 = 1)
      {
        plaatsplayer2 = plaatsplayer2 + 1;
      }
      else if(rightbuttonplayer2 = 1)
      {
        plaatsplayer2 = plaatsplayer2 - 1;
      }
      else
      {
        plaatsplayer2 = plaatsplayer2;
      }
    }  
  }
  
  if(plaatsplayer1 > 12)
  {
   plaatsplayer1 = 12; 
  }
  plaatsplayer2 = 6;
   Serial.println(plaatsplayer1);
  byte test;
   test = byte(plaatsplayer1);
   test = test << 4;
   test = test | plaatsplayer2;
   //Serial.println(test,BIN);
   output = test;
   SPI.transfer(output);
   delay(1);
}


