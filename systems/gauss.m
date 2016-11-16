function [reta, retb] = gauss(a,b)
#[reta,retb] = gauss(a,b)
#a: matriz do sistema
#b: vetor das constantes
#reta: matriz triangular superior
#retb: vetor das constantes
  n=length(a);
  for(i=1:n) #Coluna a zerar
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
