function ret = newton_ls(f,x=0,err=1e-6,n=1e1)
#newton_ls(f,x=0,err=1e-6,n=1e1)
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
  for i=1:n
    z=num2cell(x); #Array to cell
    A = jb(z{:}); #Jacobiana no ponto
    B = -f(z{:}); #Funçao no ponto
    [a,b] = gauss(A,B); #Resolve J*(x_(k+1)-x_k)=F
    y = utsolve(a,b)'; #Idem
    x += y;
    if(norm(y)<err)
      ret = x;
      return
    endif
  endfor
  ret = x;
endfunction
