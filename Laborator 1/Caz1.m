f1 = inline('-x/2','x');
f2 = inline('3-x','x');
f3 = inline('x+1','x');
A=-10; B=10;
xline1=linspace(A,B,100);
yline1=f1(xline1);
plot(xline1,yline1,'g','Linewidth',3) 

grid on
hold on

xline2=linspace(A,B,100);
yline2=f2(xline2);
plot(xline2,yline2,'r','Linewidth',3) 

xline3=linspace(A,B,100);
yline3=f3(xline3);
plot(xline3,yline3,'r','Linewidth',3)


plot([A B], [0 0],'k','Linewidth',2.4) 
plot([0 0], [A B],'k','Linewidth',2.4); 

[xi,yi] = polyxpoly(xline1,yline1,xline2,yline2);
[xj,yj] = polyxpoly(xline3,yline3,xline2,yline2);
[xk,yk] = polyxpoly(xline3,yline3,xline1,yline1);
mapshow(xi,yi,'DisplayType' ,'point','Marker','o')
mapshow(xj,yj,'DisplayType','point','Marker','o')
mapshow(xk,yk,'DisplayType','point','Marker','o')


patch([xi xj xk],[yi yj yk],'b');

xlabel('x')
ylabel('y')
