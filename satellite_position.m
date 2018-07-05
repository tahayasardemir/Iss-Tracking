function satellite_position()
global mu a n
format long e
mu= 398600; % standart gravitional parameter 
data=['http://www.celestrak.com/NORAD/elements/stations.txt'];
tle=webread(data); % read up to date TLE data
% convert all the data from degree to rad
Me = str2num(tle(1,141:148))*(pi/180); % Mean anomaly from TLE data (rad)
n = str2num(tle(1,150:160)); % mean motion from TLE data (rev/day)
a = semimajor(n); % calculate semimajor axis in km
e = str2num(tle(1,127:130))*10^(-7); % eccentricity from TLE data
h = angularmomentum(a,e); % calculating angular momentum 
RA = str2num(tle(1,115:122))*(pi/180); % Right ascension of the ascending node from TLE data (rad)
incl = str2num(tle(1,107:113)); % inclination from TLE data(rad)
w = str2num(tle(1,132:139))*(pi/180); % argument of perigee from TLE data (rad)
TA = trueanomaly(e,Me); % true anomaly calculated using TLE data (rad)
[r,v] = rvfromceo (h,e,RA,incl,w,TA);
t=5; % for the sake of example
[R,V] = rv_from_r0v0 (r,v,t);
end