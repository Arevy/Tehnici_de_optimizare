  function [istatus, subs, A, z]= loop(A, subs)
% Main loop of the simplex primal algorithm

function e = vr(m_dim,i_dim)
  e = zeros(m_dim,1);
  e(i_dim) = 1;
end

% m_dim2 is the min_value of d_dim
% j_dim is the index of min_value
function [m_dim2, j_dim] = Br(d_dim)
  [m_dim2, j_dim] = min(d_dim);
  if m_dim2 >= 0
    m_dim2 = [];
    j_dim = [];
  end
end


function [row_dim, mi_dim] = MRT(a_dim, b_dim)
  m_dim3 = length(a_dim);
  c_dim = 1:m_dim3;
  a_dim = a_dim(:);
  b_dim = b_dim(:);
  l_dim = c_dim(b_dim > 0);
  [mi_dim, row_dim] = min(a_dim(l_dim)./b_dim(l_dim));
  row_dim = l_dim(row_dim);
end


  istatus = -1;
  A
  historysubs = subs;
  [m, n] = size(A);
  [mi, col] = Br(A(m,1:n-1));
  z = A(m,n);
  while ~isempty(mi) & mi < 0 & abs(mi) > eps
    t = A(1:m-1,col);
    if all(t <= 0)
      z = -inf;
      disp(sprintf('\n Unbounded optimal solution with z=%s\n',z))
      istatus = 32;
      return
    end

    % smaller one 
    [row, small] = MRT(A(1:m-1,n),A(1:m-1,col));
  
    if ~isempty(row)
      if abs(small) <= 100*eps
        [s,col] = Br(A(m,1:n-1));
      end
      disp(sprintf(' pivot row-> %g pivot column->%g',row,col))
    end
  
    A(row,:)= A(row,:)/A(row,col);
    subs(row) = col;
    for i = 1:m
      if i ~= row
        A(i,:)= A(i,:)-A(i,col)*A(row,:);
      end
    end
  
    [mi, col] = Br(A(m,1:n-1));
    A
    pz = historysubs - ones(size(historysubs,1), 1) * subs; 

    if ~all(any(pz'))
      istatus = 1;
      disp(sprintf('\n Degeneration case found.\n'))
      return 
    end
    historysubs = [historysubs; subs];
  end
  z = A(m,n);
end