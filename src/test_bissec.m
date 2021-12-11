#Escreva o script test_bissec.m  para testar sua implementação nas situações abaixo, 
#usando tol = 10e-6. O script também deve plotar os gráficos de cada uma das funções abaixo.

while(true)                                                   #Loop para seleção da função para o teste

  f1 = "cos(x)"                                               #em [0, 2]; 
  f2 = "x",                                                   #em [-1, 1]; 
  f3 = "x.^2" ,                                               #em [-1, 2]; 
  f4 = "x.^3 - 2.5*x.^2 - 2.5*x - 3.5"                        #em[-5.5, 10.5].
  f5 = "x.^2 + x.*cos(2*x) - 3"                               #em [-1.5, -1.0]
  f6 = "2*x + cos(2*x) - 2*x.*sin(2*x)"                       #em [1,5,2.5]
  
  entrada = input("\nDigite qual funcao deseja avaliar\n","s")#leitura do teclado
  
  switch (entrada)                                            #Switch para seleção da função
    case "f1"
      f = f1; a = 0;b = 2;
      break
    case "f2"
      f = f2; a = 1; b = -1;
      break
    case "f3"
      f = f3; a = -1;b = 2;
      break
    case "f4"
      ff = f4; a = -5.5; b = 10.5;
      break
    case "f5"
      f = f5; a = -1.5;b = -1.0;
      break
    case "f6"
      f = f6; a = 1.5; b = 2.5;
      break
    otherwise                                             #Caso não escolha uma das funções
      printf("\n\nOpcao nao selecionada\n\n")
   endswitch
  
endwhile

funcao = inline(f);                                       #Transforma o função f em uma função inline

tol = 10e-6;                                              #Tolerância

xx=linspace(a,b);                                         #Um array que vária de [a,b]

plot(xx,funcao(xx));grid                                  #Plot de gráfico
title(f);                                                 #Título do gráfico
xlabel("Eixo - X");                                       #Nome do eixo-x
ylabel("Eixo - F(X)");                                    #Nome do eixo-y

k = 0;                                                    #Apenas um contador
kLimite = 1000;                                           #O laço while repetirá, no maxímo, k vezes
                                                          #Qualquer valor > 1 é permitido para k
                                                          #Porém para algumas equações isso pode resultar em uma demora na conclusão do algoritmo

if(funcao(a)*funcao(b) > 0)                               #Teorema 1 
                  
    printf("Intervalo [%.2f, %.2f] não possui raizes segundo o Teorema 1", a, b)
    
else    
  printf("\n__________________________________\n\n")      #Apenas um print
  res = 999999999;                                        #Para o criterio de parada
  
  while(res > tol && k < kLimite)                         #Condição limite para apenas evitar a demora
    
    k = k + 1                                             #Incremento do contador
 
    estimativa_x = (a + b)/2                              #x estimado pela metade da soma de a e b
    
    f_estimativa = funcao(estimativa_x)                   #fx estimado na metade da soma de a e b
    
    
    if(f_estimativa == 0)                                 #Se f(x) = 0 então para pois a raiz foi encontrada
      x = estimativa_x;                                   #x é ,aproximadamente, a metade da soma de a e b
      printf("Fim do algoritmo, f(x) = 0 no ponto estimado atual") #Apenas um print
      printf("\n__________________________________\n")    #Apenas um print
      break                                               #Finaliza o loop
    endif
    
    res = abs(b - a)                                      #Para o criterio de parada
    
    if(funcao(a)*funcao(estimativa_x) < 0)                #Verifica qual será o novo valor de a ou b
      b = estimativa_x;                                   #b recebe a metade da soma de a e b
    else
      a = estimativa_x;                                   #a recebe a metade da soma de a e b
    endif
    printf("\n__________________________________\n")      #Apenas um print
  endwhile

endif
