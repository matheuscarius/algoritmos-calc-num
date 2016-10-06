function ret = newton(f,x,err=1e-6,n=1e3,h=1e-6)
#newton(f,x,err=1e-6,n=1e3,h=1e-6)
#f: function handle
#x: chute inicial
#err: erro
#n: numero de iterações
#h: variação da derivada
  for i=1:n
    df = der(f,x,h);
    last = x;
    x=x-f(x)./df;
    last -= x;
    last = last*last';
    if(sqrt(last)<err)
      break;
    endif
  endfor
  ret = x;
endfunction
