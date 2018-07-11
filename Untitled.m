clear all

a=arduino('COM4');
servoAttach(a,4);
servoAttach(a,5);
servoAttach(a,6);
servoAttach(a,7);
K=75.567225730904198;
L= -33.550569078894284;

c=90+(K/2);
d=90+(K/2);
x=90+(L/2);
y=90+(L/2);
if K<0 
    c=K-K+900;
    d=90+K;
if L<0
        x=L-L+90;
        y=90+L;
end
end     
 servoWrite(a,4,c);
 servoWrite(a,5,d); 
 servoWrite(a,6,x);    
 servoWrite(a,7,y);
 