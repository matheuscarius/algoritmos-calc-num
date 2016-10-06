function [reta, retb] = gauss(a,b)
#a: matriz do sistema
#b: vetor das constantes
  n=length(a);
  for(i=1:n) #Coluna a zerar
    idx = i;
    for(j=i+1:n) #Pivoteamento Parcial
      if(abs(a(j,i)) > abs(a(idx,i)))
        idx = i;
      endif
    endfor
    #Troca as linhas
    aux = a(i,:);
    a(i,:)=a(idx,:);
    a(idx,:)=aux;
    for(j=i+1:n) #Linha a zerar
      m=a(j,i)/a(i,i); #Coeficiente da linha
      for(k=1:n)
        a(j,k) -= a(i,k)*m; #Subtraindo linha
      endfor
      b(j) -= m*b(i);
    endfor
  endfor
  reta = a;
  retb = b;
endfunction
