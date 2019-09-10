% Cazul 1
A = [2 -1 1 6 -5 -1 0;1 1 2 1 2 0 -1];
b = [6;3];
c = [3 4 6 7 1 0 0];
[istatus, ib, xb, Mtx] = simplex_step1(A, b)
[istatus, iB, xB] = simplex_step2(Mtx, ib, xb, c)
s = size(A,2);
y = linprog(c,[],[],A,b,zeros(s,1),[],[])
disp(sprintf('\n Cazul 1 \n'))
disp(sprintf('Apasa orice tasta pt a continua ...\n\n'))
pause

% Cazul 2
A = [1 -1 1 1 0; -2 1 -2 0 1];
b = [5; 10]
c = [-3 1 0 0 0];
[istatus, ib, xb, Mtx] = simplex_step1(A, b)
[istatus, iB, xB] = simplex_step2(Mtx, ib, xb, c)
s=size(A,2);
y=linprog(c,[],[],A,b,zeros(s,1),[],[])
disp(sprintf('\n Cazul 2 \n'))
disp(sprintf('Apasa orice tasta pentru a continua ...\n\n'))
pause

% test case 3
A = [1 0 0 1/4 -8 -1 9; 0 1 0 1/2 -12 -1/2 3; 0 0 1 0 0 1 0];
b = [0; 0; 1];
c = [0 0 0 -3/4 20 -1/2 6];
[istatus, ib, xb, Mtx] = simplex_step1(A, b)
[istatus, iB, xB] = simplex_step2(Mtx, ib, xb, c)
disp(sprintf('\n test case 3 ends \n'))
disp(sprintf(' Press any key to continue ...\n\n'))
pause

% test case 4
A= [-1 2 1 1; -4 4 -1 0; 1 0 -1 0];
b = [2;4;0];
c = [1 -1 0 0];
[istatus, ib, xb, Mtx] = simplex_step1(A, b)
disp(sprintf('\n test case 4 ends \n'))
disp(sprintf(' Press any key to continue ...\n\n'))
pause

% test case 5
A = [-1 -1 -1];
b = [3];
c = [1 2 3];
[istatus, ib, xb, Mtx] = simplex_step1(A, b)
disp(sprintf('\n test case 5 ends \n'))


