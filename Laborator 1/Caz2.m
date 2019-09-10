f1 = inline('-x','x')
f2 = inline('x','x')
f3 = inline('x/2','x')
A=-10; B=10; 
x1=linspace(A,B,100);
y1=f1(x1);
plot(x1,y1,'g','Linewidth',3) 

grid on
hold on

x2=linspace(A,B,100);
y2=f2(x2);
plot(x2,y2,'r','Linewidth',3) 

x3=linspace(A,B,100);
y3=f3(x3);
plot(x3,y3,'r','Linewidth',3) 


plot([A B], [0 0],'k','Linewidth',2.4) 
plot([0 0], [A B],'k','Linewidth',2.4); 

[xi,yi] = polyxpoly(x1,y1,x2,y2);
[xj,yj] = polyxpoly(x3,y3,x2,y2);
[xk,yk] = polyxpoly(x3,y3,x1,y1);
mapshow(xi,yi,'DisplayType' ,'point','Marker','o')
mapshow(xj,yj,'DisplayType','point','Marker','o')
mapshow(xk,yk,'DisplayType','point','Marker','o')

patch([xi xj xk],[yi yj yk],'b');

xlabel('x')
ylabel('y')

patch([0 10 10],[0 5 10],'b');
