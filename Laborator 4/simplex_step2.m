function [istatus, iB, xB] = simplex_step2(Mtx, ib, xb, c)
	A = [Mtx xb];
	[m,n] = size(A);
	cb = c(ib)';
	cbmul = repmat(cb,1,n);
	w = sum(cbmul .* A);
	w = w - [c 0];
	w = - w; 
	A = [A;w];

	subs = ib;
	[istatus, subs, A, z]= loop(A, subs);

	if istatus == -1
  	disp(sprintf('\n Problema are o solutie optima finita \n'))
	end

	iB = subs;
	xB = A(1:m, n);

%cb_new = c(subs)';
%result = sum(xB.*cb_new);