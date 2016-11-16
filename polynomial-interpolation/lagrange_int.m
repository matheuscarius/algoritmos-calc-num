function [p, L] = lagrange_int(x,y)
#[p,L] = lagrange_int(x,y)
#x: x array
#y: y array
#p: polinômio de lagrange
#L: matriz dos polinômios da base de Lagrange

n = length(x);
p = 0;
for i=1:n
  l = 1;
  for j=1:n
    if (i!=j)
      l = conv(l, [1, -x(j)])/(x(i)-x(j));
    endif
  endfor
  L(i,:)=l;
  p += y(i)*l;
endfor

endfunction
