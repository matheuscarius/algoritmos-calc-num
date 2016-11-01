function ret = der(f,x,h=1e-6)
#ret(f,x,h=1e-6)
#f: function handle
#x: ponto
#h: delta
  ret = (f(x+h*x)-f(x))/(h*x);
endfunction
