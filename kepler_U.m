% 
function x = kepler_U(dt, ro, vro, alpha)
% 
%
% This function uses Newtons method to solve the universal
% Kepler equation for the universal anomaly.
%
% mu - gravitational parameter (km3/s2)
% x - the universal anomaly (km0.5)
% dt - time since x = 0 (s)
% ro - radial position (km) when x = 0
% vro - radial velocity (km/s) when x = 0
% alpha - reciprocal of the semimajor axis (1/km)
% z - auxiliary variable (z = alpha*x2)
% C - value of Stumpff function C(z)
% S - value of Stumpff function S(z)
% n - number of iterations for convergence
% nMax - maximum allowable number of iterations
% ------------------------------------------------------------
global mu
%...Set an error tolerance and a limit on the number of
% iterations:
error = 1.e-8;
nMax = 1000;
%...Starting value for x:
x = sqrt(mu)*abs(alpha)*dt;
%...Iterate on Equation 3.62 until convergence occurs within
%...the error tolerance:
n = 0;
ratio = 1;
while abs(ratio) > error && n <= nMax
n = n + 1;
C = stumpC(alpha*x^2);
S = stumpS(alpha*x^2);
F = ro*vro/sqrt(mu)*x^2*C + (1 - alpha*ro)*x^3*S + ro*x-...
sqrt(mu)*dt;
dFdx = ro*vro/sqrt(mu)*x*(1 - alpha*x^2*S)+...
(1 -alpha*ro)*x^2*C+ro;
ratio = F/dFdx;
x = x - ratio;
end
%...Deliver a value for x, but report that nMax was reached:
if n > nMax
fprintf('\n **No. iterations of Kepler''s equation')
fprintf(' = %g', n)
fprintf('\n F/dFdx = %g\n', F/dFdx)
end
end