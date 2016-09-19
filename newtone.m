function ret = newtone(f,x,err,h)
#newton(f,x,n)
#f: function handle
#x: chute inicial
#err: erro
#h: variação para derivada
  while( abs(f(x)) > err )
    df=der(f,x,h);
    x=x-f(x)./df;
  endwhile
  ret = x;
endfunction
