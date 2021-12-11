function x = bissec(f, a, b, tol)
 
 funcao = inline(f);                                    #Transforma a string ,pasada em f, em uma fun��o inline
 
 k = 0;                                                 #Apenas um contador
 kLimite = 1000;                                        #O la�o while repetir�, no max�mo, k vezes
                                                        #Qualquer valor > 1 � permitido para k
                                                        #Por�m para algumas equa��es isso pode resultar em uma demora na conclus�o do algoritmo
  if(funcao(a)*funcao(b) > 0)                           #Condi��o de exist�ncia 
                    
      printf("Intervalo [%.2f, %.2f] n�o possui raizes segundo o Teorema 1", a, b)
      
  else    
    printf("\n__________________________________\n\n")   #Apenas um print
    res = 999999999;                                     #Para o criterio de parada
    
    while(res > tol && k < kLimite)                      #Condi��o limite para apenas evitar a demora
      
      k = k + 1                                          #Incremento do contador
   
      estimativa_x = (a + b)/2                           #x estimado pela metade da soma de a e b
      
      f_estimativa = funcao(estimativa_x)                #fx estimado na metade da soma de a e b
      
      
      if(f_estimativa == 0)                               #Se f(x) = 0 ent�o para pois a raiz foi encontrada
        x = estimativa_x;                                 #x � ,aproximadamente, a metade da soma de a e b
        printf("Fim do algoritmo, f(x) = 0 no ponto estimado atual")#Apenas um print
        printf("\n__________________________________\n")   #Apenas um print
        break                                              #Finaliza o loop
      endif
      
      res = abs(b - a)                                     #Para o criterio de parada
      
      if(funcao(a)*funcao(estimativa_x) < 0)               #Verifica qual ser� o novo valor de a ou b
        b = estimativa_x;                                  #b recebe a metade da soma de a e b
      else
        a = estimativa_x;                                  #a recebe a metade da soma de a e b
      endif
      printf("\n__________________________________\n")    #Apenas um print
    endwhile

  endif

endfunction

