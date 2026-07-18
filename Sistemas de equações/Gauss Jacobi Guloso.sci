clear(); clc();

printf("\n********** Método Iterativo de Gauss Jacobi GULOSO**********\n");
//printf("**********Resolução iterativa de sistemas lineares********** \n");


//A matriz deve ser estritamente diagonal dominante.
//Isso significa que o valor absoluto do elemento da diagonal deve ser maior que a soma dos outros elementos da mesma linha.


A = [-0.1,-0.2,1,0.2;
    0.6,3,-0.6,-0.3;
    2,1,-0.2,0.2;
    0.4,1.2,-0.8,4]
B = [1;-7.8;0.4;-10]



 printf(">>Dados de entrada matriz A e vetor B:\n");
 printf(">>Entrada Matriz A (original)\n");
 disp(A);
 printf(">>Entrada Matriz B (original)\n");
 disp(B);
 
 n = length(B);
 Nmax = 100;
 epsilon = 1.0e-6;
 X0 = [0; 0; 0; 0];
 X = X0;
 T = A;
 
//funçao gulosa
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
printf(">>>>>>>>>>reordenação gulosa>>>>>>>>>>>>>>>");
[A,B sucesso, ordem_linhas] = reordenar_greedy(A, B);

if sucesso then
    printf("\n ***((reordenção gulosa aplicada com sucesso))***\n");
    printf("ordem das linhas escolhidas:\n");
    disp(ordem_linhas');
    printf(" saida - matriz A (reordenada)\n");
    disp(A);
    printf(" saida - vetor B (reordenado)\n");
    disp(B);
else
    error("erro n deu pra reordenar\n");
end
 //Verificação de pivos nulos na diagonal principal
 for i = 1:n
     if A(i,i) == 0 then
         error("ERRO: elemento nulo na diagonal principal.");
     end
 end
 
 printf("-------------- Processo Iterativo-----------------:");
 
 convergiu = %f;
 for k = 1:Nmax
     for i = 1:n
         S = 0;
         for j = 1:n
             if i ~= j then
                 S = S + A(i,j) * X0(j);
             end
         end
         X(i) = (B(i) - S) / A(i,i);
 end
 erro = max(abs(X - X0));
 if erro < epsilon then
     convergiu = %t;
     break;
 end
 
 X0 = X;
end

printf("\n Número de iterações:");
disp(k);

printf(" (Erro final: %.6e)", erro);

if convergiu then
    printf("\n>> O método convergiu dentro da tolerância estabelecida<<\n");
else
    printf("\n  ATENÇAÕ: o método atingiu o numero máximo de iterações sem covergir\n");
end

printf(" Vetor solução do sistema:\n");
mprintf("  %.6f\n", X);

printf(" Verificação da soluçao, se AX = B *****:\n");

for i = 1:n
    s = 0;
    for j = 1:n
        s =s + T(i,j) * X(j);
        if j < n then
            printf("(%.3f*%.3f) + ",T(i,j), X(j));
        end
        if j == n then
            printf("(%.3f*%.3f) = ", T(i,j), X(j));
            printf("%.3f\n", s);
        end
    end
end
printf("-------------------- fim de gauss-jacobi--------------------");

