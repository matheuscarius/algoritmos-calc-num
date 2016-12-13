function y = runge_kutta_4_h(f,a,b,h,y0)
#y = runge_kutta_4_h(f,a,b,n,y0)
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
  k1 = h*f(x    ,w     );
  k2 = h*f(x+h/2,w+k1/2);
  k3 = h*f(x+h/2,w+k2/2);
  k4 = h*f(x+h  ,w+k3  );
  w += (k1+2*k2+2*k3+k4)/6;
  x += h;
  y(i) = w;
endfor

endfunction
