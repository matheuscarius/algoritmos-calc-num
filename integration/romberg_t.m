function [I,R] = romberg_t(f,a,b,n)
#I = romberg_t(f,a,b,n)
#I: integral
#f: function handle
#a: limite inferior
#b: limite superior
#n=1: número de divisões
R = zeros(n);
h = zeros(1,n);
h(1) = b-a;
for i=2:n
  h(i)=h(i-1)/2;
endfor

R(1,1)=h(1)/2*(f(a)+f(b));
for k=2:n

  R(k,1) += R(k-1,1);
  for i=1:2^(k-2)
    R(k,1) += h(k-1)*f(a+(2*i-1)*h(k));
  endfor
  R(k,1)/=2;

  for j=2:k
    R(k,j)=R(k,j-1)+(R(k,j-1)-R(k-1,j-1))/(4^(j-1)-1);
  endfor

endfor
I = R(n,n);
endfunction
