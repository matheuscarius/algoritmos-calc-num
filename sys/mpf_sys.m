function ret = mpf_sys(phi,x=0,err=1e-6,n=1e3)
#mpf_sys(phi,x,err=1e-6,n=1e3)
#phi: function handle
#x: array inicial
#err: erro
#n: número de iterações
  if(x==0)
    x=ones(1,nargin(phi))
  endif
  for(i=1:n)
    last = x;
    z=num2cell(x); #Cell
    x=phi(z{:});
    len = length(x);
    maior = 0;
    for(j=1:len)
      maior = max(maior,abs(x(j)-last(j)));
    endfor
    if(maior<err)
      ret = x;
      return;
    endif
  endfor
  ret = x;
endfunction
