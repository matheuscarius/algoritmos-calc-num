function [P] = lagrange_interpolation_sym(x, y)
#[P,L] = lagrange_interpolation(x,y)
#P: coeficientes do polinomio
#L: matriz dos polinomios da base
#x: x array
#y: y array
pkg load symbolic;
n = length(x);
P = 0;
syms z;
for i=1:n
  l=1;
  for j=1:n
    if(i!=j)
      l = l*(z-x(j))/(x(i)-x(j));
    endif
  endfor
  P += l*y(i);
endfor
P = expand(P);
endfunction
