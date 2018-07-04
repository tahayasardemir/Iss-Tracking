% Algorithm for converting keplerian elements to cartesian coordinates %
global mu
format long
mu= 398600; % standart gravitional parameter 
% convert all the data from degree to rad
Me = 204.2868*(pi/180); % Mean anomaly from TLE data (rad)
n = 15.54 ; % from TLE data (rev/day)
a = semimajor(n); % calculate semimajor axis in km
e = 0.0003435; % from TLE data
h = angularmomentum(a,e); % calculating angular momentum 
RA = 295.8524*(pi/180); % from TLE data (rad)
incl = 51.6414*(pi/180); % from TLE data(rad)
w = 262.6267*(pi/180); % from TLE data (rad)
TA = trueanomaly(e,Me); 
% coe - orbital elements [h e RA incl w TA] in radian
coe=[h e RA incl w TA] %necessary values are taken from satellite TLE data 
%...Equations 4.37 and 4.38 (rp and vp are column vectors):
rp = (h^2/mu) * (1/(1 + e*cos(TA))) * (cos(TA)*[1;0;0] ...
+ sin(TA)*[0;1;0]);
vp = (mu/h) * (-sin(TA)*[1;0;0] + (e + cos(TA))*[0;1;0]);
%...Equation 4.39:
R3_W = [ cos(RA) sin(RA) 0
-sin(RA) cos(RA) 0
0 0 1];
%...Equation 4.40:
R1_i = [1 0 0
0 cos(incl) sin(incl)
0 -sin(incl) cos(incl)];
%...Equation 4.41:
R3_w = [ cos(w) sin(w) 0
-sin(w) cos(w) 0
0 0 1];
%...Equation 4.44:
Q_pX = R3_W'*R1_i'*R3_w';
%...Equations 4.46 (r and v are column vectors):
r = Q_pX*rp;
v = Q_pX*vp;
%...Convert r and v into row vectors:
r = r'
v = v'


