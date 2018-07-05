function satellite_position()
global mu a n
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
TA = trueanomaly(e,Me); %calculated using TLE data (rad)
[r,v] = rvfromceo (h,e,RA,incl,w,TA);
t=5; % for the sake of example
[R,V] = rv_from_r0v0 (r,v,t);
end