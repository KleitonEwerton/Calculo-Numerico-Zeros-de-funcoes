
#Onde f � uma fun��o definida inline no Octave, g � uma fun��o definida inline no Octave que computa a derivada da fun��o f,
#x0 � a aproxima��o inicial para um zero de f, tol � a toler�ncia para o criterio de parada 
#e N � o limite para a quantidade de passos. Sua implementa��o deve retornar a aproxima��o para a raiz, x,
#o valor da fun��o em x, f_x, a quantidade de itera��es necess�ria at� a converg�ncia n, e erro em cada itera��o, 
#res.  Teste considerando uma toler�ncia de 10E-06.


function [x, n, res] = newton ( f , g ,x0, tol, N )
  
  x = "Raiz n�o encontrada";                            #Inicializando

  n=0;                                                  #Apenas inicia o n

  m=zeros (1 , N) ;                                     #Cria uma coluna

  m=[x0 m] ;                                          

  s=@(x) f(x)./g(x) ;                                   #Fun��o inline s para calcular f(x) / g(x)
  printf("\n__________________________________\n\n")    #Apenas um print
  
  for k=1:N                                             #La�o for at� atingir o limite ou encontrar a melhor raiz
    
    
    m(1,k+1) = m(1,k)-s(m(1,k));                        #Calcula a melhor raiz
    
    x0
    n=k                                                 #n(intera��es) ser� igual ao k
    res = abs(m(1,k+1) - m(1,k))                        #Erro calculado
    x=m(1,k+1)                                          #Raiz atual  
    fx = f(x)
    if res < tol                                        #Se o erro atual for menor que o tol muda a raiz e encera o la�o for
        x=m(1,k+1);                                     #Atualiza a matriz
        printf("\n__________________________________\n")#Apenas um print
        break
        
    endif
    
    printf("\n__________________________________\n")    #Apenas um print
    
  endfor

endfunction