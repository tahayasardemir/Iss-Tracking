servoAttach(a,4);
servoAttach(a,5);
servoAttach(a,6);
servoAttach(a,7);

% deneme açýlarý
K=180;
L=0;
c=K/2;
d=K/2;
x=L/2;
y=L/2;

if K<0 
    c=180;
    d=180+K;

   
    
    if L<0
        x=180;
        y=180+L;
    end
end
      
  
    
servoWrite(a,4,c);
 servoWrite(a,5,d); 
 servoWrite(a,6,x);    
 servoWrite(a,7,y);

 
 

     




