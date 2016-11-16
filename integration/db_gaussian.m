function J = db_gaussian(f, a, b, c, d, n, m)
#db_gaussian(f,a,b,c,d,n,m)
#f: f(x,y)
#a: limite inferior de x
#b: limite superior de x
#c: limite inferior de y (pode ser funcao ou valor)
#d: limite superior de y (pode ser funcao ou valor)
#n: divisões de x
#m: divisões de y


if(strcmp(typeinfo(c),"scalar")) c = @(x) c; endif
if(strcmp(typeinfo(d),"scalar")) d = @(x) d; endif

rn = newton(n);
cn = peso(n);
rm = newton(m);
cm = peso(m);

h1 = (b-a)/2;
h2 = (b+a)/2;
J = 0;

for i=1:n
  JX = 0;
  x = h1*rn(i)+h2;
  d1=d(x);
  c1=c(x);
  k1=(d1-c1)/2;
  k2=(d1+c1)/2;

  for j=1:m
    y=k1*rm(j)+k2;
    Q = f(x,y);
    JX += cm(j)*k1*Q;
  endfor
  J += cn(i)*h1*JX;
endfor

endfunction
