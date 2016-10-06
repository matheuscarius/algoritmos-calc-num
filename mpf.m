function ret = mpf(phi,x,er=1e-6,n=1e3)
#mpf(phi,x,er=1e-6,n=1e3)
#phi: function handle
#x: valor inicial
#er: erro
#n: número de iterações
  for i=1:n
    last = x;
    x=phi(x);
    if(abs(x-last)<er)
      break;
    endif
  endfor
  ret = x;
endfunction
