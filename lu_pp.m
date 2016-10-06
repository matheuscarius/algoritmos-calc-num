function [L,U,P] = lu_pp(a)
#[L,U,P] = lu_pp(a)
#a: matriz do sistema
#L: matriz triangular inferior
#U: matriz triangular superior
#P: matriz permutação
  n=length(a);
  L = eye(n);
  P = eye(n);
  for(i=1:n) #Coluna a zerar
    id = i;
    for(j=i+1:n)
      if(abs(a(j,i))>abs(a(id,i)))
        id = j;
      endif
    endfor

    #Trocar linhas
    aux = a(i,:);
    a(i,:)=a(id,:);
    a(id,:)=aux;
    aux = P(i,:);
    P(i,:)=P(id,:);
    P(id,:)=aux;

    for(j=i+1:n) #Linha a zerar
      m=a(j,i)/a(i,i); #Coeficiente da linha
      for(k=i:n)
        a(j,k) -= a(i,k)*m; #Subtraindo linha
      endfor
      a(j,i)=m;
    endfor
  endfor
  U = a;
  for(i=1:n)
    for(j=1:i-1)
      U(i,j)=0;
      L(i,j)=a(i,j);
    endfor
  endfor
endfunction
