function c = mycos ( x )
  
 k = 0;                                           #Inicia-se em 0, incrementar até atingir a condição
 t = ((-1)^k) * ((x^(2*k))/factorial(2*k));       #Primeiro termo
 c = 0;                                           #Cos atual
 
 while ( c + t ~= c )                             #Condição: soma do cos atual e do termo serem muito próximas
      
      if(k > 10000)                               #Para impedir loop infinito
        break                                     #Já que quando maior o x, mais tempo leva
      endif
      
      c = c + t ;                                 #Incrementa o cos atual

      k = k + 1;                                  #Incrementa o contador k
      
      t = ((-1)^k) * ((x^(2*k))/factorial(2*k));  #Calcula o proximo termo
      
 endwhile
 
  
  cos_1   = cos(1)                                #Cos(1) para apenas comparação
  termos = k                                      #Termos calculados
    
endfunction

