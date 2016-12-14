function w = calor(L,a,T1,T2,f,n,T,IS,ET,TOL,NMI)
#u = calor(L,a,T1,T2,f,n,T,IS,ET,TOL,NMI)
#L: comprimento
#a: alpha
#T1: temperatura esquerda
#T2: temperatura direita
#f: temperatura inicial
#n: numero de divisoes
#T: tempo desejado
#IS: extremidade direita isolada
#ET: equilibrio termico
#TOL: tolerancia equilibrio
#NMI: maximo de iteracoes

h = L/n;
p = h*h/(2*a*a);

if(IS)
  nc = n+1;
  T2 = f(L);
else
  nc = n;
endif

if(!ET)
  NMI = ceil(T/p)+1;
  TOL = 0;
endif

x = 0;

for i=2:n
  x += h;
  u(i,1) = f(x);
endfor
u(1,1) = T1;
u(nc+1,1)=u(n,1);
u(n+1,1) = T2;

D = 1;
j = 1;

while(D > 0 && j < NMI)
  D = 0;
  j += 1;
  u(1,j) = T1;
  u(n+1,j) = T2;
  for i=2:nc
    u(i,j)=(u(i-1,j-1)+u(i+1,j-1))/2;
    if (abs(u(i,j)-u(i,j-1))>TOL) D = 1; endif
  endfor
  if(nc>n) u(nc+1,j)=u(n,j); endif
endwhile

w=u(:,j);
if(nc>n) w(nc+1)=[]; endif


