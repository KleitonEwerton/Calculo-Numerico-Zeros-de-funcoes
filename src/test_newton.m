#Escreva um script test_newton.m para determinar os zeros da função abaixo pelo método de newton. 
#o script deve gerar o  gráfico (iters x res) para cada uma dessas funções:

while(true)                                #Loop do menu de seleção da equação

  f1 = "cos(x)"                            #em [0, 2];   
  d1 = "-sin(x)";                       
  f2 = "x"                                 #em [-1, 1]; 
  d2 = "1";                             
  f3 = "x.^2"                              #em [-1, 2]
  d3 = "2*x";                           
  f4 = "x.^3 - 2.5*x.^2 - 2.5*x - 3.5"     #em[-5.5, 10.5] 
  d4 = "3*x.^2 - 2*2.5*x - 2.5";         
  f5 = "x.^2 + x.*cos(2*x) - 3"            #em [-1.5, -1.0]
  d5 = "2*x - 2*x*sin(2*x) + cos(2*x)"; 
  f6 = "2*x + cos(2*x) - 2*x.*sin(2*x)"    #em [1,5,2.5] 
  d6 = "2 - 4*sin(2*x) - 4*x*cos(2*x)"; 
  
  entrada = input("\nDigite qual funcao deseja avaliar\n","s")
  
  switch (entrada)                         #switch para seleção da função a ser avaliada
    case "f1"
      f = f1; d = d1; x0 = 1;a = 0;b = 2;
      break
    case "f2"
      f = f2; d = d2; x0 = 0;a = -1; b = 1;
      break
    case "f3"
      f = f3; d = d3; x0 = -1;a = -1;b = 2;
      break
    case "f4"
      f = f4; d = d4; x0 = 10.5;a = -5.5; b = 10.5;
      break
    case "f5"
      f = f5; d = d5; x0 = -1.5;a = -1.5;b = -1.0;
      break
    case "f6"
      f = f6; d = d6; x0 = 1.5;a = 1.5; b = 2.5;
      break
    otherwise
      printf("\n\nOpcao nao selecionada\n\n")
   endswitch
endwhile

fx = inline(f);                                      #Transforma a função f(x) em inline
gx = inline(d);                                      #Transforma a derivada de f(x) em inline

tol = 10e-6;                                         #Tolerância
N = 1000;                                            #Interações maxímas

x = "Raiz não encontrada";                           #Inicializando

vectorInteracoes = zeros(1,0);                       #Vetor de interações
vectorerros      = zeros(1,0);                       #Vetor de erros

n=0;                                                 #Apenas inicia o n

m=zeros (1 , N) ;                                    #Cria uma coluna

m=[x0 m] ;                                          

s=@(x) fx(x)./gx(x);                                 #Função inline s para calcular f(x) / g(x)
printf("\n__________________________________\n\n")   #Apenas um print


for k=1:N                                            #Laço for até atingir o limite ou encontrar a melhor raiz
  
  m(1,k+1) = m(1,k)-s(m(1,k));                       #Calcula a melhor raiz
  
  x0
  n=k                                                #n(interações) será igual ao k
  res = abs(m(1,k+1) - m(1,k))                       #Erro calculado
  x=m(1,k+1)                                         #Raiz atual  
  f_x = fx(x)
  vectorInteracoes(end+1) = n;                       #Adiciona o n ao vetor de interação
  vectorerros(end+1) = res;                          #Adiciona o erro ao vetor de erro
  if res < tol                                       #Se o erro atual for menor que o tol muda a raiz e encera o laço for
      x=m(1,k+1);                                    #Atualiza a matriz
      
      printf("\n__________________________________\n")#Apenas um print
      break
      
  endif
  printf("\n__________________________________\n")    #Apenas um print
endfor

plot(vectorInteracoes,vectorerros);grid              #Plota o gráfico
title(f);                                            #Titulo do gráfico
xlabel("ITERS - Interações");                        #Nome do eixo-x
ylabel("RES - Erro");                                #Nome do eixo-y

if(fx(a)*fx(b) > 0)                                  #Teorema 1         
    printf("OBS: Intervalo [%.2f, %.2f] não possui raizes segundo o Teorema 1", a, b)
endif






