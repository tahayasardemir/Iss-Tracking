function [fdot, gdot] = fDot_and_gDot(x, r, ro, alfa)
% ˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜˜
%
% This function calculates the time derivatives of the
% Lagrange f and g coefficients.
%
% mu - the gravitational parameter (kmˆ3/sˆ2)
% alfa - reciprocal of the semimajor axis (1/km)
% ro - the radial position at time t (km)
% t - the time elapsed since initial state vector (s)
% r - the radial position after time t (km)
% x - the universal anomaly after time t (kmˆ0.5)
% fDot - time derivative of the Lagrange f coefficient (1/s)
% gDot - time derivative of the Lagrange g coefficient
% (dimensionless)

% ------------------------------------------------------------
global mu
z = alfa*x^2;
%...Equation 3.66c:
fdot = sqrt(mu)/r/ro*(z*stumpS(z) - 1)*x;
%...Equation 3.66d:
gdot = 1 - x^2/r*stumpC(z);
end