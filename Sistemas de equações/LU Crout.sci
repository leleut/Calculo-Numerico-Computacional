clear(); clc(); //limpa as variaveis e limpa console


printf("\n****** Método de Decomposição LU - Crout ******\n")
//printf("Resolução direta de sistemas de equações linerares\n")
//Assim como a Gauss sem pivoteamento, ela é sensível a zeros na diagonal.
/////////////////////exemplo 3.1/////////////////////////
printf(" ******* Dados de entrada - Matriz A e Matriz B *****")
//dados de entrada - matriz dos coef. e vetor dos termos independentes


A = [3,2,-1,1;
    2,-2,4,-3;
    1,1,1,-1;
    2,3,1,4]
B = [9;11;8;21]


T = A;
printf("\n.....Entrada - Matriz A (original):\n");
disp(A);
printf(".....Entrada - Matriz B (original):\n");
disp(B);

//.....................................................................
printf("*************** FATORAÇÃO LU ***************:");
// fatoracao A = LU por Crout
n = length(B);
L = zeros(n,n);
U = zeros(n,n);

// diagonal U eh unitaria por Crout
for j = 1:n
    U(j,j) = 1;
end
for j = 1:n
    // calculo da coluna j de L
    for i = j:n
        SomaLU = 0;
        for k = 1:j-1
            SomaLU = SomaLU + L(i,k) * U(k,j);
        end
        L(i,j) = A(i,j) - SomaLU;
    end
    // verificacao pivo nulo
    if L(j,j) == 0 then
        error("ERRO: pivô nulo durante a fatoração LU-Crout.");
    end
    // calculo da linha j de U
    for i = j+1:n
        SomaLU = 0;
        for k = 1:j-1
            SomaLU = SomaLU + L(j,k) * U(k,i);
        end
        U(j,i) = (A(j,i) - SomaLU) / L(j,j);
    end
end

printf("\n Saída - Fator L:\n");
disp(L);
printf(" Saída - Fator U:\n");
disp(U);

//.....................................................................
printf("*************** SUBSTITUIÇÃO PROGRESSIVA ***************:");
// resoluçao de LY = B
Y = zeros(n,1);
if L(1,1) == 0 then
   error("ERRO: pivô nulo durante a substituição progressiva."); 
end
Y(1) = B(1) / L(1,1);
for i = 2:n
    SomaLY = 0;
    for j = 1:i-1
        SomaLY = SomaLY + L(i,j)*Y(j);
    end
    if L(i,i) == 0 then
        error("ERRO: pivô nulo durante a substituição progressiva.");
    end
    Y(i) = (B(i) -  SomaLY) / L(i,i);
end

printf("\n Solução Y (LY = B) do sistema:\n");
disp(Y);

//.....................................................................
printf("*************** SUBSTITUIÇÃO RETROATIVA ***************:");
// resolucao de UX = Y
X = zeros(n,1);

// como U tem diagonal unitaria por Crout, eh desnecessaria a divisao por U(i,i)
X(n) = Y(n);
for i = (n-1:-1:1)
    SomaUX = 0;
    for j = (i+1:n)
        SomaUX = SomaUX + U(i,j) * X(j);
    end
    X(i) = Y(i) - SomaUX;
end

printf("\n Solução X (UX = Y) do sistema:\n");
mprintf(" %.6f\n", X);

//.....................................................................
printf("****** VERIFICAÇÃO DA SOLUÇÃO, SE AX = B ****** \n");
// verificando a soluçao sendo que AX = B
for i = 1:n
    s = 0;
    for j = 1:n
        s = s + T(i,j) * X(j);
        if (j < n) then
            printf("(%.3f*%.3f) + ", T(i,j), X(j));
        end
        if (j == n) then
            printf("(%.3f*%.3f) = ", T(i,j), X(j));
            printf("%.3f\n", s);
        end
     end
end

//.....................................................................
printf("************ FIM DA ELIMINAÇÃO CROUT ************");
///////////////////////////////////////////////////////////////////////
