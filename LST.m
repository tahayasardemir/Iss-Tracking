% Returns local sidereal time 
% y=> year
% m=> month
% d=> day
% ut=> universal time
% EL=> east longitude
function lst=LST(y,m,d,ut,EL)
j0=J0(y,m,d);
j=(j0-2451545)/36525;
g0=100.4606184+36000.77004*j+0.000387933*j^2 ...
-2.583e-8*j^3;
g0=zeroTo360(g0);
gst=g0+360.98564724*ut/24; % Greenwich sidereal time
lst=gst+EL; 
lst=lst-360*fix(lst/360) % local sidereal time
end