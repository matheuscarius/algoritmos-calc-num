function x = gauss_seidel(a,b,x=0,err=1e-6,it=1e3)
#gauss_jacobi(a,b,x=0,err=1e-6,n=1e3)
#a: matriz do sistema
#b: vetor das constantes
#x: chute inicial
#err: erro
#it: número de iterações
  if(x==0)
    x = b;
  endif
  n=length(b);
  for(i=1:it) #iteração
    ox = x;
    maior = 0;
    for(j=1:n) #linha a calular
      x(j)=b(j);
      for(k=1:n) #contribuição da coluna
        if(k==j)
          continue; #não se contribui
        endif
        x(j)-=a(j,k)*x(k);
      endfor
      x(j)/=a(j,j);
    endfor
    maior = max(maior,abs(x(j)-ox(j)));
  endfor
  if(maior < err)
    return;
  endif
endfunction
