function x = utsolve(u,b)
#utsolve(u,b)
#u: matriz triangular superior
#b: vetor coluna
  n = length(b);
  for i=n:-1:1
    soma = 0;
    for j=i+1:n
      soma += u(i,j)*x(j);
    endfor
    x(i)=(b(i)-soma)/u(i,i);
  endfor
  x=x';
endfunction
