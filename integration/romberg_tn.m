function [I,R] = romberg_tn(f,a,b,n)
#I = romberg_tn(f,a,b,n)
#I: integral
#f: function handle
#a: limite inferior
#b: limite superior
#n=1: número de divisões
R = zeros(n);
h = zeros(1,n);
for k=1:n

  R(k,1)=trapezoidal(f,a,b,2^(k-1)*n);

  for j=2:k
    R(k,j)=R(k,j-1)+(R(k,j-1)-R(k-1,j-1))/(4^(j-1)-1);
  endfor

endfor
I = R(n,n);
endfunction
