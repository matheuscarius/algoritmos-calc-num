function J = db_simpson(f, a, b, c, d, n, m)
#db_simpson(f,a,b,c,d,n,m)
#f: f(x,y)
#a: limite inferior de x
#b: limite superior de x
#c: limite inferior de y (pode ser funcao ou valor)
#d: limite superior de y (pode ser funcao ou valor)
#n: divisões de x
#m: divisões de y

if(mod(n,2) || mod(m,2))
  fprintf(stderr, "n e m devem ser pares\n");
  return;
endif

if(strcmp(typeinfo(c),"scalar")) c = @(x) c; endif
if(strcmp(typeinfo(d),"scalar")) d = @(x) d; endif

h = (b-a)/n;
J1 = 0; #End terms
J2 = 0; #Even terms
J3 = 0; #Odd terms

for i=0:n
  x = a + h*i;
  HX = (d(x)-c(x))/m;
  K1 = f(x,c(x))+f(x,d(x)); #End terms
  K2 = 0; #Even terms
  K3 = 0; #Odd terms

  for j=1:m-1
    y=c(x)+HX*j;
    Q = f(x,y);
    if(mod(j,2)==0) K2 += Q;
    else K3 += Q; endif
  endfor
  L = (K1+2*K2+4*K3)*HX/3;

  if(i==0 || i==n) J1 += L;
  elseif(mod(i,2)==0) J2 += L;
  else J3 += L; endif

endfor

J = h/3*(J1+2*J2+4*J3);

endfunction
