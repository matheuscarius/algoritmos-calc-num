function ret = newtone(f,x,err,h)
#newtone(f,x,err,h)
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
