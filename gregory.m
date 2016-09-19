function ret = gregory(n)
#gregory(n)
#n: grau máximo da expansão
  sinal = 1;
  ret = 0;
  for x=0:n
    ret += sinal/(1+2*x);
    sinal *= -1;
  end
  ret *= 4;
end
