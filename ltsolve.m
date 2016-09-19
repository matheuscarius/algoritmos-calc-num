function x = ltsolve(l,b)
#ltsolve(l,b)
#l: matriz triangular inferior
#b: vetor coluna
  n = length(b);
  for i=1:n
    soma = 0;
    for j=1:(i-1)
      soma += l(i,j)*x(j);
    endfor
    x(i)=(b(i)-soma)/l(i,i);
  endfor
endfunction
