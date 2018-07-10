function test_1()
a=arduino('COM4');
servoAttach(a,4);
servoAttach(a,5);
servoAttach(a,6);
servoAttach(a,7);
time=clock;
[x,y]=look_angles(time); 
% deneme açýlarý
Initial_x=90;
Initial_y=90;
Az=(Initial_x+x)/2;
El=(Initial_y+y)/2;
  
servoWrite(a,4,Az);
servoWrite(a,5,Az); 
servoWrite(a,6,El);    
servoWrite(a,7,El);
end
 

     




