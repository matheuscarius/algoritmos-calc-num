function [reta, retb, retc] = gauss_pt(a,b)
#[reta,retb,retc] = gauss(a,b)
#a: matriz do sistema
#b: vetor das constantes
#reta: matriz triangular superior
#retb: vetor das constantes
#retc: vetor das colunas trocadas
  n=length(a);
  col = 1:n;
  for(i=1:n) #Coluna a zerar
    idr = i;
    idc = i;
    for(j=i:n) #Pivoteamento Total
      for(k=i:n)
        if(abs(a(j,k)) > abs(a(idr,idc)))
          idr = j;
          idc = k;
        endif
      endfor
    endfor

    #Troca as linhas
    aux = a(i,:);
    a(i,:)=a(idr,:);
    a(idr,:)=aux;
    aux = b(i);
    b(i)=b(idr);
    b(idr)=aux;
    #Troca as colunas
    aux = a(:,i);
    a(:,i)=a(:,idc);
    a(:,idc)=aux;
    aux = col(i);
    col(i)=col(idc);
    col(idc)=aux;

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
  retc = col;
endfunction
