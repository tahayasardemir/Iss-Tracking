% Algorithm for converting keplerian elements to cartesian coordinates %
function [r,v] = rvfromceo (h,e,RA,incl,w,TA)
global mu a n
format long
% coe - orbital elements [h e RA incl w TA] in radian
ceo = [h e RA incl w TA]; %necessary values are taken from satellite TLE data 
%...Equations 4.37 and 4.38 (rp and vp are column vectors):
rp = (h^2/mu) * (1/(1 + e*cos(TA))) * (cos(TA)*[1;0;0] ...
+ sin(TA)*[0;1;0]);
vp = (mu/h) * (-sin(TA)*[1;0;0] + (e + cos(TA))*[0;1;0]);
%...Equation 4.39:
R3_W = [ cos(RA) sin(RA) 0
-sin(RA) cos(RA) 0;
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
end

