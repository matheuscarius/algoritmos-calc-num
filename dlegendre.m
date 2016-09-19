function ret = dlegendre(n,x)
#dlegendre(n,x)
#n: grau do polinômio
#x: ponto da derivada
  if n==0
    ret = 0;
  else
    ret = -x*leg(n,x)+leg(n-1,x); 
    ret *= n/(1-x^2);
  end
end
