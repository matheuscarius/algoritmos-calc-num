function [P, D] = newton_interpolation_pt(x, y, z)
#[P,D] = newton_interpolation(x,y)
#P: valor do polinomio interpolador no ponto
#D: diferencas divididas
#x: x array
#y y array
#z: ponto a ser calculado o polinomio

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

P = 0;
for i=1:n
  w = 1;
  for j=1:i-1
    w *= (z-x(j));
  endfor
  P += C(i)*w;
endfor

endfunction
