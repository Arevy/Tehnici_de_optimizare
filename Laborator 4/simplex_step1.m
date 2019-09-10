function [istatus, ib, xb, Mtx] = simplex_step1(A, b)

  b = b(:);
  ib = [];
  xb = [];
  Mtx = [];
  [m, n] = size(A);
  ncol = length(A);
  A = [A eye(m) b];
  if m > 1
    w = -sum(A(1:m,1:ncol));
  else
    w = -A(1,1:ncol);
  end
  A = [A;[w zeros(1,m) -sum(b)]];

  subs = ncol+1:ncol+m;
  av = subs;
  [istatus, subs, A, z] = loop(A, subs);
  
  istatus = 1;
  nc = ncol + m + 1;
  x = zeros(nc-1,1);
  x(subs) = A(1:m,nc);
  xs = x(subs);
  xa = x(av);
  com = intersect(subs,av);
  
  if (any(xa) ~= 0)
    disp(sprintf('\n\n Regiune fezabila goala\n'))
    istatus = 4;
    return
  else
    if ~isempty(com) | (any(xs) == 0)   
      istatus = 16;
      disp(sprintf('\n\n 16 Initializarea a esuat\n'))
    end
  end

  if istatus == 1
    disp('Initializarea s-a terminat')
    ib = subs;
    [m_new, n_new] = size(A); 
    xb = A(1:m_new-1, n_new);
    Mtx = A(1:m_new-1, 1:n);
  end
end
