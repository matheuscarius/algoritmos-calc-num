function g = cholesky(a)
#cholesky(a)
#a: matriz quadrada
  if columns(a) != rows(a)
    fprintf(stderr, "Não é quadrada\n");
    return
  endif
  n = columns(a);
  for k=1:n
    soma = 0;
    for j = 1:(k-1)
      soma += g(k,j)*g(k,j);
    endfor
    r=a(k,k)-soma;
    g(k,k)=realsqrt(r);
    for i=(k+1):n
      soma = 0;
      for j=1:(k-1)
        soma += g(i,j)*g(k,j);
      endfor
      g(i,k)=(a(i,k)-soma)/g(k,k);
    endfor
  endfor
endfunction
