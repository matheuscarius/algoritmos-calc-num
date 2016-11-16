function ret = bissecao(f,l,r,er=1e-6,m_it=1e3)
#bissecao(f,l,r,er=1e-6,m_it=1e3)
#f: function handle
#l: interval left
#r: interval right
#er: error
#m_it: maximum of iterations
  cont = 0;
  while(abs(r-l)>er)
    cont++;
    if(cont > m_it)
      fprintf(stderr,"Maximum of iterations reached\n");
      return;
    endif
    m = (l+r)/2;
    if(f(l)*f(m)<=0)
      r = m;
    elseif(f(m)*f(r)<=0)
      l = m;
    else
      fprintf(stderr,"Out of bounds\n");
      return;
    endif
  endwhile
  ret = (l+r)/2;
endfunction
