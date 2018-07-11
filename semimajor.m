% returns semimajor axis in km
function a=semimajor(n)
global mu
% n => mean motion from TLE data (rev/day)
% calculate 'a' with converting rev/day to rad/s
a = (mu/((n*(2*pi/86400))^2))^(1/3)
end