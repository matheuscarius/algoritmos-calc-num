function ret = newtone(f,x,err)
#newton(f,x,n)
#f: function handle
#x: chute inicial
#err: erro
  while( abs(f(x)) > err )
    EPS=1e-9;
    df=(f(x+EPS)-f(x))/EPS;
    x=x-f(x)./df;
  endwhile
  ret = x;
endfunction
