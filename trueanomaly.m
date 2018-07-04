% returns ture anomaly using eccentricity and mean anomaly by calculating
% eccentric anomaly(E)
function TA = trueanomaly(e,Me)
E = kepler_E(e,Me); % Eccentric anomaly (rad)
TA = 2*atan(tan(E/2)/sqrt((1-e)/(1+e)))
end