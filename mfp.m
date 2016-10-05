function ret = mfp(f,l,r,er=1e-6,n=1e3)
#mpf(f,l,r,er=1e-6,n=1e3)
#f: function handle
#l: interval left
#r: interval right
#er: error
#n: maximum of iterations
  cont = 0;
  while(abs(r-l)>er)
    m=(l*abs(f(r))+r*abs(f(l)))/(abs(f(l))+abs(f(r)));
    if(f(l)*f(m)<=0)
      r = m;
    elseif(f(m)*f(r)<=0)
      l=m;
    else
      fprintf(stderr,"Out of bounds\n");
      return;
    endif
    cont++;
    if(cont>n)
      fprintf(stderr,"Maximum iterations reached\n");
      return;
    endif
  endwhile
  ret = m;
endfunction
