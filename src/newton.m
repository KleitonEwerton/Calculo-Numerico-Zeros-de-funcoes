
#Onde f é uma função definida inline no Octave, g é uma função definida inline no Octave que computa a derivada da função f,
#x0 é a aproximação inicial para um zero de f, tol é a tolerância para o criterio de parada 
#e N é o limite para a quantidade de passos. Sua implementação deve retornar a aproximação para a raiz, x,
#o valor da função em x, f_x, a quantidade de iterações necessária até a convergência n, e erro em cada iteração, 
#res.  Teste considerando uma tolerância de 10E-06.


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