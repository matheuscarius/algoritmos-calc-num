function ret = newton_ls(f,x=0,err=1e-6,n=1e1)
#newton_ls(f,x=0,n=1e1)
#f: symbolic function
#x: vetor inicial
#err: erro
#n: número de iterações
  jb = jacobian(f); #Calcula jacobiana
  if(x==0)
    x = ones(1,length(jb));
  endif
  jb = matlabFunction(jb); #Jacobiana no ponto
  f = matlabFunction(f); #Função no ponto
  for i=1:n
    z=num2cell(x);
    A = jb(z{:});
    B = -f(z{:});
    y = gauss_seidel(A,B);
    x += y;
    if(norm(y)<err)
      ret = x;
      return
    endif
  endfor
  ret = x;
endfunction
