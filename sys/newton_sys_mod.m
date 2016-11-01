function ret = newton_sys(f,x=0,err=1e-6,n=1e1)
#newton_sys_mod(f,x=0,err=1e-6,n=1e1)
#f: symbolic function
#x: vetor inicial
#err: erro
#n: número de iterações
  jb = jacobian(f); #Calcula jacobiana
  if(x==0)
    x = ones(1,length(jb));
  endif
  jb = matlabFunction(jb); #Jacobiana convertida
  f = matlabFunction(f); #Função convertida
  z=num2cell(x); #Converte array pra cell
  A = jb(z{:}); #Jacobiana Inicial
  [L,U] = lu(A);#Decomposicao LU
  for i=1:n
    z=num2cell(x);
    B = -f(z{:});
    y = ltsolve(L,B); #Resolver Ly=B
    w = utsolve(U,y); #Resolver Ux=y
    x += w';
    len = length(w);
    maior = 0;
    for(j=1:len)
      maior = max(maior,abs(w(j)));
    endfor
    if(maior<err)
      ret = x;
      return;
    endif
  endfor
  ret = x;
endfunction
