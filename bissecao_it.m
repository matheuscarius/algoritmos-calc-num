function ret = bissecao_it(f,l,r,n=1e3)
#bissecao(f,l,r,n=1e3)
#f: function handle
#l: esquerda
#r: direita
#n: número de iterações
  for i=1:n
   m = (l+r)/2;
    if(f(l)*f(m)<=0)
      r=m;
    elseif(f(m)*f(r)<=0)
      l=m;
    else
      fprintf(stderr,"Out of bounds\n");
      return;
    end
  end
  ret = (l+r)/2;
end
