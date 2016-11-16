function [L,U] = lu_dec(a)
#[L,U] = lu_dec(a)
#a: matriz do sistema
#L: matriz triangular inferior
#U: matriz triangular superior
  n=length(a);
  L = eye(n);
  for(i=1:n) #Coluna a zerar
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
