function ret = bissecao(f,l,r,n)
#bissecao(f,l,r,n)
#f: function handle
#l: esquerda
#r: direita
#n: número de iterações
  for i=1:n
   m = (l+r)/2;
    if(f(l)*f(m)<0)
      r=m;
    else
      l=m;
    end
  end
  ret = (l+r)/2;
end
