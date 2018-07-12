function [Az,El]=look_angles(time)
global mu n a EL NL 
format long e
EL = 32.8; % lonitude of Gazi teknopark
NL = 39.8;% latitude of Gazi teknopark
rad = pi/180;
dgr = 180/pi;
[x_o,y_o,z_o,lst] = observervector(time) % Get observer vector and local sidereal time

[R,V] = satellite_position(time)
% i, j, k of satellite position vector
x_s = R(1,1);
y_s = R(1,2);
z_s = R(1,3);
% i, j, k of satellite velocity vector
xdot_s = V(1,1);
ydot_s = V(1,2);
zdot_s = V(1,3);
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Calculating the look angles 
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~
r_x = x_s - x_o;
r_y = y_s - y_o;
r_z = z_s - z_o;
% Transform to the topocentric-horizon system
% First rotate through an angle lst(local sidereal time) about z axis
% And then through an angle NL(observers north latitude) about y axis
r_s = sin(NL*rad)*cos(lst*rad)*r_x...
    + sin(NL*rad)*sin(lst*rad)*r_y...
    - cos(NL*rad)*r_z;
r_e = -sin(lst*rad)*r_x + cos(lst*rad)*r_y;
r_z = cos(NL*rad)*cos(lst*rad)*r_x...
    + cos(NL*rad)*sin(lst*rad)*r_y...
    + sin(NL*rad)*r_z;
r = sqrt((r_s^2)+(r_e^2)+(r_z^2)); % The range to the satellite in km 
% the look angles 
El = asin(r_z/r)*dgr % Elevation in degrees
Az = atan(-r_e/r_s)*dgr % Azimuth in degrees
end
