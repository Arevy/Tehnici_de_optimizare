f = @(x) x.^2 + x + 3;
X = linspace(-5,5,100);
Y = f(X);
plot(X,Y)
[min] = MetodaNewton1(f,-1,1,10.^(-7),0.001)
hold on
plot(min ,f(min),'r*')
