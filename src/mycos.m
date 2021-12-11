function c = mycos( x )
  
 k = 0;                                           #Inicia-se em 0, incrementar ate atingir a condicao
 t = ((-1)^k) * ((x^(2*k))/factorial(2*k));       #Primeiro termo
 c = 0;                                           #Cos atual
 
 while ( c + t ~= c )                             #Condicao: soma do cos atual e do termo serem serem diferentes do cos atual
      
      if(k > 10000)                               #Para impedir loop infinito,
        break                                     #já que quando maior o x, mais tempo leva
      endif
      
      c = c + t ;                                 #Incrementa o cos atual

      k = k + 1;                                  #Incrementa o contador k
      
      t = ((-1)^k) * ((x^(2*k))/factorial(2*k));  #Calcula o proximo termo
      
 endwhile
 
  
  cos_1   = cos(1)                                #Cos(1) para apenas comparacao
  termos = k                                      #Termos calculados
    
endfunction

