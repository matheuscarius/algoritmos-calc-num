function ans = dec2bin2(x)
  i = 1;
  ans = "";
  while(x>0)
    ans=[ans num2str(mod(x,2))];
    x = idivide(x,2);
    i+=1;
  endwhile
  ans = flip(ans);
endfunction
