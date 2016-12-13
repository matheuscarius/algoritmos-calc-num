function y = euler_h(f,a,b,h,y0)
#y = euler_h(f,a,b,h,y0)
#f: function handle f(x,y)
#a: limite inferior
#b: limite superior
#h: passo
#y0: valor inicial

n = ceil((b-a)/h);
y = zeros(1,n);
w = y0;
x = a;

for i=1:n
  w += h*f(x,w);
  x += h;
  y(i) = w;
endfor

endfunction
