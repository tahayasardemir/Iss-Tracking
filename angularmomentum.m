% Calculate angular momentum using semimajor axis 'a' and eccentricity 'e'
function h = angularmomentum(a,e)
global mu
h = sqrt(mu*a * (1 - e^2));
end