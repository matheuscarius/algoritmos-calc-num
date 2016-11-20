function [P, C, D, w] = newton_interpolation2(x, y)
#[P,C,D,w] = newton_interpolation2(x,y)
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
  for j=i:n
    D(j,i) = (D(j,i-1)-D(j-1,i-1))/(x(j)-x(j-i+1));
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
