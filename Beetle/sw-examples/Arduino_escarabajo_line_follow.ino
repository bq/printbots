#include <Servo.h>

Servo servoR;
Servo servoL;
Servo claw;

const int SL = 2;    // the number of the left sensor pin
const int SR= 3;     // the number of the right sensor pin

//-- Right and left IR sensors values
int rs,ls;

const int BLACK = 0;
const int WHITE = 1;


void setup(){
  pinMode(SL, INPUT);
  pinMode(SR, INPUT);
  enable();
}

void loop(){
  rs = digitalRead(SR);
  ls= digitalRead(SL);

//-- Move the robot according to the inputs
  if (ls == WHITE && rs == WHITE){ 
     move_Forward();
     claw_open();
     delay(10);
  }  

  else if (ls == WHITE && rs == BLACK){  
     move_Right();
     claw_close();
  }  

  else if (ls == BLACK && rs == WHITE){
     move_Left();
     claw_open();
  }  
  
  else{ 
     Stop();
     
  }
}


void enable(){
  
   servoR.attach(9);  
   servoL.attach(10);
   claw.attach(4);
    
   servoL.write(90);
   servoR.write(90);
   claw.write(3);
}


void Stop(){
  
   servoL.write(90);
   delay(10);
   servoR.write(90);
   delay(10);
}

void move_Forward(){

    servoL.write(0);
    delay(10);
    servoR.write(180);
    delay(10);
}

void move_Back(){
  
    servoL.write(180);
    delay(10);
    servoR.write(0);
    delay(10);
}

void move_Right(){

    servoL.write(0);
    delay(10);
    servoR.write(90);
    delay(10); 
}

void move_Left(){

   servoL.write(90);
   delay(10);
   servoR.write(180);
   delay(10);
}

void claw_open(){
  claw.write(3);
}

void claw_close(){
  claw.write(50);
}

