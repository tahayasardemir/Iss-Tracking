function [f, g] = f_and_g(x, t, ro, alpha)
% ��������������������������������������
%
% This function calculates the Lagrange f and g coefficients.
%
% mu - the gravitational parameter (km�3/s�2)
% alpha - reciprocal of the semimajor axis (1/km)
% ro - the radial position at time t (km)
% t - the time elapsed since t (s)
% x - the universal anomaly after time t (km�0.5)
% f - the Lagrange f coefficient (dimensionless)
% g - the Lagrange g coefficient (s)
%
% ------------------------------------------------------------
global mu
z = alpha*x^2;
%...Equation 3.66a:
f = 1 - x^2/ro*stumpC(z);
%...Equation 3.66b:
g = t - 1/sqrt(mu)*x^3*stumpS(z);
end