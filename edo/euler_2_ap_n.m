function w = euler_2_ap_n(f,a,b,n,y0,z0)
#y = euler_2_ap_n(f,a,b,n,y0,z0)
#f: function handle f(x,y,z) z=y'
#a: limite inferior
#b: limite superior
#n: numero de passos
#y0: y inicial
#z0: z inicial

h = (b-a)/n;
y = z = zeros(1,n);
x = a;
y = y0;
j = z = z0;

for i=1:n
  g = f(x,y,z);
  j += h/2*g + h/2*f(x+h,y+h*z,z+h*g);
  y += h/2*z + h/2*(z+h*g);
  x += h;
  w(i) = y;
  z = j;
endfor

endfunction
