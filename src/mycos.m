#x é o angulo que se deve calcular o cos
function c = mycos( x )
  
  k = 0;                                           #Inicia-se em 0, incrementar ate atingir a condicao
  t = ((-1)^k) * ((x^(2*k))/factorial(2*k));       #Primeiro termo
  c = 0;                                           #Cos atual

  while ( c + t ~= c )                             #Condicao: soma do cos atual e do termo serem serem diferentes do cos atual
      
      if(k > 10000)                               #Para impedir loop infinito,
        break;                                    #já que quando maior o x, mais tempo leva
      endif
      printf("\n__________________________________\n\n");  #Apenas um print
      c = c + t ;                                 #Incrementa o cos atual

      k = k + 1;                                  #Incrementa o contador k
      
      t = ((-1)^k) * ((x^(2*k))/factorial(2*k));  #Calcula o proximo termo
      
      printf("Interacao:    %i\n", k);
      printf("cos(x) atual: %f\n",c);
    
  endwhile
  printf("\n__________________________________\n");#Apenas um print                             
  printf("Termos totais: %d\n",k);                 #Termos calculados
  printf("cos(1) =       %.12f\n",cos(1));                  #Cos(1) para apenas comparacao   
  printf("cos(x) =       %.12f\n",c); 
endfunction

