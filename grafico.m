function ret = grafico(f,l,r,n)
#graf(f,l,r,n)
#f: function handle
#l: esquerda
#r: direita
#n: quantidade de pontos
  x = linspace(l,r,n);
  ret = [];
  for y=1:n-1
    if(f(x(y))*f(x(y+1))<0)
      ret = [ret (x(y)+x(y+1))/2];
      return;
    end
  end
  if(!length(ret))
    fprintf(stderr,"grafico: Não foi possível achar raiz\n");
  endif
end
