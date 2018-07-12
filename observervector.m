% Returns observer's position vector in ECI
function [x_o,y_o,z_o,lst] = observervector(time)
global mu n a EL NL 
% Date:
currenttime=time; %returns current time as a (1,6) matrix
year = currenttime(1);
month = currenttime(2);
day = currenttime(3);
% Universal time:
hour = currenttime(4)-1; % convert local(computer) time to UTC
minute = currenttime(5);
second = currenttime(6);

% Express the longitude of the observer as decimal numbers:
EL = 32.8 % lonitude of Gazi teknopark
WL = 360 - EL; % west longitude

ut = hour + minute/60 + second/3600; % Express universal time as a decimal number:
lst = LST(year, month, day, ut, EL); % Get local sidereal time


R_e = 6378.135 % Radius of earth in km
z_o = (R_e)*sin(NL); % k component of observer's position vector
R = (R_e)*cos(NL*(pi/180)); % Radius at a distance z_o from origin
x_o = (R)*cos(lst*(pi/180)); % i component of observer's position vector 
y_o = (R)*sin(lst*(pi/180)); % j component of observer's position vector

%...Echo the input data and output the results to the command window:
fprintf('---------------------------------------------------')
fprintf('\n Example 5.6: Local sidereal time calculation\n')
fprintf('\n Input data:\n');
fprintf('\n Year = %g', year)
fprintf('\n Month = %g', month)
fprintf('\n Day = %g', day)
fprintf('\n UT (hr) = %g', ut)
fprintf('\n West Longitude (deg) = %g', WL)
fprintf('\n East Longitude (deg) = %g', EL)
fprintf('\n\n');
fprintf(' Solution:')
fprintf('\n');
fprintf('\n Local Sidereal Time (deg) = %g', lst)
fprintf('\n Local Sidereal Time (hr) = %g', lst/15)
fprintf('\n Radius (km) = %g', R)
fprintf('\n Position Vector of Observer (km) = %g i', x_o)
fprintf('\n Position Vector of Observer (km) = %g j', y_o)
fprintf('\n Position Vector of Observer (km) = %g k', z_o)
fprintf('\n-----------------------------------------------\n')
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
end

