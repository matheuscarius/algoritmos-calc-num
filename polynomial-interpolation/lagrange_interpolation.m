function [P, L] = lagrange_interpolation(x, y)
#[P,L] = lagrange_interpolation(x,y)
#P: coeficientes do polinomio
#L: matriz dos polinomios da base
#x: x array
#y: y array

n = length(x);
P = 0;
for i=1:n
  l=1;
  for j=1:n
    if(i!=j)
      l = conv(l, [1, -x(j)])/(x(i)-x(j));
    endif
  endfor
  L(i,:)=l;
  P += l*y(i);
endfor

endfunction
