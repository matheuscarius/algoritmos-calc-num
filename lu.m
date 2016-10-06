function [L,U] = lu(a)
#[L,U] = lu(a)
#a: matriz do sistema
#L: matriz triangular inferior
#U: matriz triangular superior
  n=length(a);
  L = eye(n);
  for(i=1:n) #Coluna a zerar
    for(j=i+1:n) #Linha a zerar
      m=a(j,i)/a(i,i); #Coeficiente da linha
      for(k=1:n)
        a(j,k) -= a(i,k)*m; #Subtraindo linha
      endfor
      L(j,i)=m;
    endfor
  endfor
  U = a;
  for(i=1:n)
    for(j=1:i-1)
      U(i,j)=0;
    endfor
  endfor
endfunction
