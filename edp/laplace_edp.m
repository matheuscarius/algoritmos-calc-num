function u = laplace_edp(n,m,ta,tb,tc,td,TOL=1e-6)

u = zeros(n+1,m+1);

for j=2:n
  u(j,1)=tc;
  u(j,m+1)=td;
endfor
for j=2:m
  u(1,j)=ta;
  u(n+1,j)=tb;
endfor

D = 1;
while(D)
  D = 0;
  for i=2:n
    for j=2:m
      v = (u(i-1,j)+u(i+1,j)+u(i,j+1)+u(i,j-1))/4;
      if(abs(u(i,j)-v)>TOL) D=1; endif
      u(i,j)=v;
    endfor
  endfor
endwhile

endfunction
