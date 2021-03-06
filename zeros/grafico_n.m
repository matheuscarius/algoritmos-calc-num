function ret = grafico_n(f,l,r,n=1e3)
#grafico_n(f,l,r,n=1e3)
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
