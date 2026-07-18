clear(); clc(); 

printf("****Eliminação de Gauss sem pivoteamento****")
//printf("Resolução direta de sistemas de equações linerares\n")
// Gauss sem pivoteamento, ela é sensível a zeros na diagonal.

printf("\n ******* Dados de entrada - Matriz A e Vetor B *****\n")
//dados de entrada - matriz dos coef. e vetor dos termos independentes (vetor solução)

A = [3,2,-1,1;
    2,-2,4,-3;
    1,1,1,-1;
    2,3,1,4]
B = [9;11;8;21]

T = A;
printf(".....Entrada - Matriz A (original):\n");
disp(A);
printf(".....Entrada - Matriz B (original):\n");
disp(B);
n = length(B);
//printf("\n DIMENSÃO MATRIZ:")
//disp(n) // atribução para a verificação dos resultados)

//....................................................................
printf(" ******************** TRIANGULARIZAÇÃO **********:")
//alg. de triangularização
n = length(B)
for k = (1:n-1)
    for i = (k+1:n)
        m = A(i,k)/ A(k,k)
        A(i,k) = 0
        for j = (k+1:n)
            A(i,j) = A(i,j) - A(k,j) * m
        end
        B(i) = B(i) - B(k) * m
        //printf("/nMatriz A/n")
        //disp(A);
        //printf("/nMatriz B/n")
        //disp(B);
    end
end

printf("\n Saída - Matriz A (triangularizada):\n");
disp(A);
printf(" Saída - Vetor B (triangularizada):\n");
disp(B);


//.....................................................................
printf("*************** RETROSUBSTITUIÇÃO ***************:");
// alg. de retrosubstituicao
U = A;
C = B;
n = length(C);
X = zeros(n,1);
if U(n,n) == 0 then
    error("ERRO: pivô nulo na matriz triangular superior.");
end
X(n) = C(n) / U(n,n); // sol. ultima linha
for k = (n-1:-1:1)
    soma = 0;
    for j = (k+1:n)
        soma = soma + U(k,j)*X(j);
    end
    if U(k,k) == 0 then
        error("ERRO: pivô nulo durante a redistribuição.");
    end
    X(k) = (C(k) - soma) / U(k,k);
end

//.....................................................................
printf("\n Saída - Solução X do sistema (AX = B):\n");
mprintf("  %.6f\n", X);

//.....................................................................
printf("\n****** VERIFICAÇÃO DA SOLUÇÃO, SE AX = B ****** \n\n");
// verificando a soluçao sendo que AX = B
for i = (1:n)
    s = 0;
    for j = (1:n)
        s = s + T(i,j)*X(j);
        if (j < n) then
            printf("(%.3f*%.3f) + ",  T(i,j), X(j));
        end   
        if (j == n) then
            printf("(%.3f*%.3f) = ",  T(i,j), X(j));
            printf("%.3f\n", s);
        end
    end
end

//.....................................................................
printf("\n************ FIM DA ELIMINAÇÃO GAUSSIANA ************\n");
//////////////////////////////////////////////////////////////////////
