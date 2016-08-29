function ret = mpf(phi,x,n)
#mpf(phi,x,n)
#phi: function handle
#x: valor inicial
#n: número de iterações
  for i=1:n
    x=phi(x);
  endfor
  ret = x;
endfunction
