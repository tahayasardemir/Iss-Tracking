% Returns corresponding angle/value in between 0 and 360
function y=zeroTo360(x)
if (x >= 360)
x = x - fix(x/360)*360;
elseif (x < 0)
x = x - (fix(x/360) - 1)*360;
end
y = x;
end