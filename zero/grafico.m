function ret = grafico(f,l,r,d=1e-2)
#grafico(f,l,r,d=1e-3)
#f: function handle
#l: interval left
#r: interval right
#d: resolution
  ret = [];
  int = l:d:r;
  n = length(int);
  for i=1:n-1
    if (f(int(i)) == 0)
      ret = [ret int(i)];
    elseif(f(int(i))*f(int(i+1)) < 0 )
      ret = [ret (int(i)+int(i+1))/2];
    endif
  endfor
  if(f(int(n))==0)
    ret = [ret int(n)];
  endif
  if(!length(ret))
    fprintf(stderr,"grafico: Não foi possível achar raiz\n");
  endif
endfunction
