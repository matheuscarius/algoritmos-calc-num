function I = trapezoidal(f,a,b,n=1)
#I = trapezoidal(f,a,b,n=1)
#I: integral
#f: function handle
#a: limite inferior
#b: limite superior
#n=1: número de divisões
h = (b-a)/n;
I = 0;
for i=0:n-1
  I += h/2*(f(a+h*i)+f(a+h*(i+1)));
endfor

endfunction
