function u = laplace_edp(n,ta,tb,tc,td,TOL=1e-6)

u = zeros(n+1,n+1);

for j=2:n
  u(1,j)=ta;
  u(n+1,j)=tb;
  u(j,1)=tc;
  u(j,n+1)=td;
endfor

D = 1;
while(D)
  D = 0;
  for i=2:n
    for j=2:n
      v = (u(i-1,j)+u(i+1,j)+u(i,j+1)+u(i,j-1))/4;
      if(abs(u(i,j)-v)>TOL) D=1; endif
      u(i,j)=v;
    endfor
  endfor
endwhile

endfunction
