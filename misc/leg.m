function ret = leg(n,x)
#leg(n,x)
#n: grau do polinômio de legendre
#x: ponto
  p(1)=1;
  p(2)=x;
  for i = 2:n
    p(i+1)=(2*i-1)*x/i*p(i)-(i-1)/i*p(i-1);
  end
  ret = p(n+1);
end
