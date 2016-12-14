function u = onda(L,a,n,T,f,g,u0,un)
#u = onda(L,a,n,t,f,g,u0,un)
#L: comprimento
#a: alpha
#n: numero de divisões
#T: tempo desejado
#f: function handle posicao inicial
#g: function handle velocidade inicial
#u0: condicao de contorno 0
#un: condicao de contorno L

h = L/n;
p = h/a;

m = ceil(T/p);

u=zeros(n+1,m+1);
for i=1:m+1
  u(1,i) = u0;
  u(n+1,i) = un;
endfor
t = x = 0;

for i=2:n
  x += h;
  u(i,1) = f(x);
endfor

t += p;
x = 0;

for i=2:n
  x += h;
  u(i,2)=(u(i+1,1)+u(i-1,1))/2+p*g(x);
endfor
j = 2;
while(t<T)
  j += 1;
  t += p;
  for i=2:n
    u(i,j) = u(i+1,j-1)+u(i-1,j-1)-u(i,j-2);
  endfor
endwhile

endfunction
