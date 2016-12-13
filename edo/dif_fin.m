function w = dif_fin(p,q,r,a,b,n,y0,yn)
#y'' = p(x)y'+q(x)y+r(x)
#w = dif_fin(p,q,r,a,b,n,y0,yn)
#p: function handle
#q: function handle
#r: function handle
#a: limite inferior
#b: limite superior
#n: numero de intervalos
#y0: f(a)
#yn: f(b)

#valores iniciais
h = (b-a)/n;
x = a+h;
a = b = c = d = l = u = z = w = zeros(1,n-1);

#Montagem da matriz tridiagonal
a(1) = -2-h*h*q(x);
b(1) = 1-p(x)*h/2;
c(1) = 0;
d(1) = h*h*r(x)-(1+p(x)*h/2)*y0;

for i=2:n-2
  x += h;
  a(i) = -2-h*h*q(x);
  b(i) = 1-p(x)*h/2;
  c(i) = 1+p(x)*h/2;
  d(i) = h*h*r(x);
endfor

x += h;
a(n-1) = -2-h*h*q(x);
b(n-1) = 0;
c(n-1) = 1+p(x)*h/2;
d(n-1) = h*h*r(x) - (1-p(x)*h/2)*yn;

#Solução da matriz tridiagonal
l(1) = a(1);
u(1) = b(1)/l(1);
z(1) = d(1)/l(1);

for i=2:n-1
  l(i) = a(i)-c(i)*u(i-1);
  u(i) = b(i)/l(i);
  z(i) = (d(i)-c(i)*z(i-1))/l(i);
endfor

w(n-1)=z(n-1);

for i=n-2:-1:1
  w(i) = z(i)-u(i)*w(i+1);
endfor

endfunction
