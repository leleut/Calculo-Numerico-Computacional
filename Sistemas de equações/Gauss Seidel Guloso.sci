clear(); clc(); //limpa variavel


printf("\n******** metodo iterativo de Seidel Guloso********");
//printf("\n resolução iterativa de sistemas lineares \n");


//precisa ser diagonal dominante ou Simétrica e Positiva Definida


A = [-0.1,-0.2,1,0.2;
    0.6,3,-0.6,-0.3;
    2,1,-0.2,0.2;
    0.4,1.2,-0.8,4]
B = [1;-7.8;0.4;-10]



printf("\n dados de entrada - matriz A e vetor B:");
printf("\n entrada - matriz a(original:\n");
disp(A)
printf(" entrada - vetor B(original:\n");
disp(B);

//....................................................
n= size (A,1);      // dimensão do sistema quadrado
Nmax= 600;          // numero macimo de iterações
epsilon = 1.0e-6;   // tolerancia
X0 = zeros(n,1);     // aproximação inicial
X = X0;             // vetor solução iteratica


function [A_greedy, B_greedy, sucesso, ordem] = reordenar_greedy(A, B)
    n = size(A,1);
    usados = zeros(n,1);
    ordem = zeros(n,1);
    sucesso = %T;
    for j = 1:n
        maior = -%inf;
        linha_melhor = -1;
        for i = 1:n
            if usados(i) == 0 then
                if abs(A(i,j)) > maior then
                    maior = abs(A(i,j));
                    linha_melhor = i;
                end
            end
        end
        if linha_melhor == -1 then
            suceso = %F;
            A_greedy = A;
            B_greedy = B;
            return;
        end
        ordem(j) = linha_melhor;
        usados(linha_melhor)= 1;
        end
     A_greedy = A(ordem,:);
     B_greedy = B(ordem);
endfunction
//................................................
printf(">>>>>>>>>>reordenaçao gulosa>>>>>>>>>>>>>>>");
[A,B sucesso, ordem_linhas] = reordenar_greedy(A, B);

if sucesso then
    printf("\n(***** reordenação gulosa aplicada com sucesso******)\n");
    printf("Ordem das linhas escolhidas:\n");
    disp(ordem_linhas');
    printf("Saida - matriz A (reordenada)\n");
    disp(A);
    printf(" Saida - vetor B (reordnado\n");
    disp(B);
else
    error("erro n deu pra reordenar\n");
end

 //Verificação de pivos nulos na diagonal principal
 for i = 1:n
     if A(i,i) == 0 then
         error("ERRO: elemento nulo na diagonal prinipal.");
     end
 end






//verificação de pivos nulos na diagonal principal
for i = 1:n
    if A(i,i) == 0 then
        error("erro: elemento nulo na diagonal principal. O metodo de gauss-seidel não pode prosseguir.");
    end
end

//.......................................................
printf(" --------------------Processo iterativo--------------------");
//laço principal
convergiu = %f;

for k = 1:Nmax
    X = X0;  //inicio da iteração
    for i = 1:n
        S1 = 0;
        for j = 1:i-1
            S1 = S1 + A(i,j) * X(j);
        end
        S2 = 0;
        for j = i+1:n
            S2 = S2 + A(i,j) * X0(j);
        end
            X(i) = (B(i) - S1 - S2) / A(i,i);
    end
    erro = max(abs(X - X0));
    if erro < epsilon then
        convergiu = %t;
        break;
    end
    X0 = X;
end
     
//..................................   
printf("\n Numero de iterações:");
disp(k);

printf(" Erro final: %.6e\n", erro);
if  convergiu then
    printf(">>>o metodo convergiu dentro da tolerancia estabeleciada.<<<\n");
else
    printf("\n>>> atenção: o metodo atingiu o numero maximo  de iterações sem convergir<<<.\n")
end

printf(" Vetor solução do sistema:\n");
mprintf("  %.6f\n", X)

//...........................................
printf("Verificação da solução, se ax = b\n")
//verificação dos resultados
for i = 1:n
    s = 0;
    for j = 1:n
        s = s + A(i,j) * X(j);
        if j < n then
            printf("(%.3f*%.3f) +  ", A(i,j), X(j));
        end
        if j == n then
            printf("(%.3f*%.3f) = ", A (i,j), X(j));
            printf("%.3f\n",s);
        end
    end
end

printf("-------------------- fim de gauss-seidel--------------------");
