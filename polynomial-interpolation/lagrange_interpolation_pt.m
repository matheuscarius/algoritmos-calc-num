function [P] = lagrange_interpolation_pt(x, y, z)
#[P] = lagrange_interpolation_pt(x,y,z)
#P: valor do polinômio
#x: x array
#y: y array
#z: ponto a ser calculado o polinômio

n = length(x);
P = 0;
for i=1:n
  l=1;
  for j=1:n
    if(i!=j)
      l = l*(z-x(j))/(x(i)-x(j));
    endif
  endfor
  P += l*y(i);
endfor

endfunction
