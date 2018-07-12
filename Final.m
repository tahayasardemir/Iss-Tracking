clc
clear all
a=arduino('COM4'); % Initialize arduino
for count=1:3600 % To run the code automatically
    
% Attach the servos to Arduino pins
servoAttach(a,4);
servoAttach(a,5);
servoAttach(a,6);
servoAttach(a,7);

time=clock; % Get local time in order to call the functions

[x,y]=look_angles(time); % Calls the function and get Azimuth and Elevation angles

x; % Azimuth 
y; % Elevation

Initial_x=90; % Azimuth Referance point of the system 
Initial_y=90; % Elevation referance point of the system
Az=Initial_x+(x/2); % Azimuth output
El=Initial_y-((y/2)); % Elevation output
  
servoWrite(a,6,Az);
servoWrite(a,7,Az); 
servoWrite(a,4,El);    
servoWrite(a,5,El);
end

 
