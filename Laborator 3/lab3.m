A = [2 4 6 1 2;
     3 5 7 0 1];
c = [1 3 5 7 9]';
B_rond = [4 5];
B = [1 2
     0 1];
b = [1 5]';
%simplex(A, c, b, B, B_rond)%---- nu gaseste k;

A2 = [3 2 1 1 0;
      2 5 3 0 1];
b2=[10 15]';
c2=[-2 -3 -4 0 0]';
B2=[A2(:,4) A2(:,5)];
B_rond2=[1 2];
%simplex(A2, c2, b2, B2, B_rond2)%--- are solutie optima;

A3=[2 1 1 1 0;
    4 2 3 0 1];
c3=[-1 -2 -3 0 0]';
b3=[2 1]';
B3=[A3(:,1) A3(:,3)];
B_rond3=[1 2];
%simplex(A3, c3, b3, B3, B_rond3)%--- nu gaseste r;

