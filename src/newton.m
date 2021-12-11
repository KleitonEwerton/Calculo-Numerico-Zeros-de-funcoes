function [x, n, res] = newton ( f , g ,x0, tol, N )
  
  x = "Raiz não encontrada";                            #Inicializando

  n=0;                                                  #Apenas inicia o n

  m=zeros (1 , N) ;                                     #Cria uma coluna

  m=[x0 m] ;                                          

  s=@(x) f(x)./g(x) ;                                   #Função inline s para calcular f(x) / g(x)
  printf("\n__________________________________\n\n")    #Apenas um print
  
  for k=1:N                                             #Laço for até atingir o limite ou encontrar a melhor raiz
    
    
    m(1,k+1) = m(1,k)-s(m(1,k));                        #Calcula a melhor raiz
    
    x0
    n=k                                                 #n(interações) será igual ao k
    res = abs(m(1,k+1) - m(1,k))                        #Erro calculado
    x=m(1,k+1)                                          #Raiz atual  
    fx = f(x)
    if res < tol                                        #Se o erro atual for menor que o tol muda a raiz e encera o laço for
        x=m(1,k+1);                                     #Atualiza a matriz
        printf("\n__________________________________\n")#Apenas um print
        break
        
    endif
    
    printf("\n__________________________________\n")    #Apenas um print
    
  endfor

endfunction