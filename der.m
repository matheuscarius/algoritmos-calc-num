function ret = der(f,x,h)
#ret(f,x,h)
#f: function handle
#x: ponto
#h: delta
  ret = (f(x+h*x)-f(x))/(h*x);
endfunction
