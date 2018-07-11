clc
clear all
a=arduino('COM4');
servoAttach(a,4);
servoAttach(a,5);
servoAttach(a,6);
servoAttach(a,7);
x=90;
y=-130;
% deneme aç?lar?
Initial_x=90;
Initial_y=90;
Az=Initial_x+(x/2);
El=Initial_y+(y/2);
  
servoWrite(a,6,x);
servoWrite(a,7,x); 
servoWrite(a,4,y);    
servoWrite(a,5,y);