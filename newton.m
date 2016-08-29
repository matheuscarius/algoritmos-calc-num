function ret = newton(f,x,n,h)
#newton(f,x,n,h)
#f: function handle
#x: chute inicial
#n: numero de iterações
#h: variação para derivada
  for i=1:n
    df = der(f,x,h);
    x=x-f(x)./df;
  endfor
  ret = x;
endfunction
