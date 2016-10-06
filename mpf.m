function ret = mpf(phi,x,n=1e3)
#mpf(phi,x,n=1e3)
#phi: function handle
#x: valor inicial
#n: número de iterações
  for i=1:n
    x=phi(x);
  endfor
  ret = x;
endfunction
