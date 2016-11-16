function J = tp_gaussian(f, a, b, c, d, s, t, n, m, p)
#tp_gaussian(f,a,b,c,d,s,t,n,m)
#f: f(x,y,z)
#a: limite inferior de x
#b: limite superior de x
#c: limite inferior de y (pode ser funcao ou valor)
#d: limite superior de y (pode ser funcao ou valor)
#s: limite superior de z (pode ser funcao ou valor)
#t: limite superior de z (pode ser funcao ou valor)
#n: divisões de x
#m: divisões de y
#p: divisões de z


if(strcmp(typeinfo(c),"scalar")) c = @(x) c; endif
if(strcmp(typeinfo(d),"scalar")) d = @(x) d; endif
if(strcmp(typeinfo(s),"scalar")) s = @(x,y) s; endif
if(strcmp(typeinfo(t),"scalar")) t = @(x,y) t; endif

rn = newton(n);
cn = peso(n);
rm = newton(m);
cm = peso(m);
rp = newton(p);
cp = peso(p);

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
    JY = 0;
    y=k1*rm(j)+k2;
    t1=t(x,y);
    s1=s(x,y);
    l1 = (t1-s1)/2;
    l2 = (t1+s1)/2;

    for k=1:p
      z = l1*rp(k)+l2;
      Q = f(x,y,z);
      JY += cp(k)*l1*Q;
    endfor
    JX += cm(j)*k1*JY;
  endfor
  J += cn(i)*h1*JX;
endfor

endfunction
