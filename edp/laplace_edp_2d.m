function u = laplace_edp_2d(n,m,h,q,k,TOL=1e-6)

t = u = zeros(n+1,m+1);

for i=2:n
  for j=2:m
    x=(i-1)*h; y=(j-1)*h;
    t(i,j) = q(x,y)*h^2/k;
  endfor
endfor

D = 1;
while(D)
  D = 0;
  for i=2:n
    for j=2:m
      v = (t(i,j)+u(i-1,j)+u(i+1,j)+u(i,j+1)+u(i,j-1))/4;
      if(abs(u(i,j)-v)>TOL) D=1; endif
      u(i,j)=v;
    endfor
  endfor
endwhile

t = -u*h^2;
u = zeros(n+1,m+1);
D = 1;

while(D)
  D = 0;
  for i=2:n
    for j=2:m
      v = (t(i,j)+u(i-1,j)+u(i+1,j)+u(i,j+1)+u(i,j-1))/4;
      if(abs(u(i,j)-v)>TOL) D=1; endif
      u(i,j)=v;
    endfor
  endfor
endwhile

endfunction
