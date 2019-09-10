function [min] = MetodaNewton1(f,a,b,eps,delta)

x1 = (a+b)/2;
xd1 = (f(x1+delta)-f(x1))/delta;
xd2 = (f(x1+delta)-2*f(x1)+f(x1-delta))/delta^2;
x2 = x1 - xd1/xd2;
while abs(x2-x1) >= eps
    x1 = x2;
    xd1 = (f(x1+delta)-f(x1))/delta;
    xd2 = (f(x1+delta)-2*f(x1)+f(x1-delta)) / delta^2;
    x2 = x1 - xd1/xd2;
end
min = x2
end