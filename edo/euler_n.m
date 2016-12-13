function y = euler_n(f,a,b,n,y0)
#y = euler_n(f,a,b,n,y0)
#f: function handle f(x,y)
#a: limite inferior
#b: limite superior
#n: numero de passos
#y0: valor inicial

h = (b-a)/n;
y = zeros(1,n);
w = y0;
x = a;

for i=1:n
  w += h*f(x,w);
  x += h;
  y(i) = w;
endfor

endfunction
