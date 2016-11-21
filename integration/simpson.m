function I = simpson(f,a,b,n=2)
#I = simpson(f,a,b,n=2)
#I: integral
#f: function handle
#a: limite inferior
#b: limite superior
#n=1: número de divisões
h = (b-a)/n;
I = 0;
for i=0:2:n-2
  I += h/3*(f(a+h*i)+4*f(a+h*(i+1))+f(a+h*(i+2)));
endfor

endfunction
