function [P, C, D, w] = newton_interpolation(x, y)
#[P,C,D,w] = newton_interpolation(x,y)
#P: polinomio interpolador
#C: coeficientes do interpolador de newton
#D: diferencas divididas
#w: polinomios base
#x: x array
#y y array
n = length(x);
D = zeros(n,n);
D(:,1) = y;

for i=2:n
  for j=2:i
    D(i,j) = (D(i,j-1)-D(i-1,j-1))/(x(i)-x(i-j+1));
  endfor
endfor

for i=1:n
  C(i)=D(i,i);
endfor

w=zeros(n,n);
w(1,n)=1;
P=zeros(1,n);
P += w(1,:)*D(1,1);

for i=2:n
  w(i,:)=conv(w(i-1,:),[1,-x(i-1)],"same");
  P+=w(i,:)*D(i,i);
endfor

endfunction
