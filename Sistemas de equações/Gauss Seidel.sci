clear(); clc(); //limpa variavel


printf("\n metodo iterativo de gauss-seidel\n");
printf("\n resolução iterativa de sistemas lineares \n");

A = [3,2,-1,1;
    2,-2,4,-3;
    1,1,1,-1;
    2,3,1,4]
B = [9;11;8;21]



printf("\n dados de entrada - matriz A e vetor B:\n");
printf("\n entrada - matriz a(original:");
disp(A)
printf("\n entrada - vetor B(original:");
disp(B);

//....................................................
n= length (B);      // dimensão do sistema quadrado
Nmax= 1100;          // numero macimo de iteracoes
epsilon = 1.0e-6;   // tolerancia
X0 = [0;0;0;0];     // aproximação inicial
X = X0;             // vetor solução iteratica
T = A;              // copia para verificação final

//verificação de pivos nulos na diagonal principal
for i = 1:n
    if A(i,i) == 0 then
        error("erro: elemento nulo na diagonal principal. O metodo de gauss-seidel não pode prosseguir.");
    end
end

//.......................................................
printf("\n processo iterativo");
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
            S2 = S2 + A(i,j) * X(j);
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
printf("\n numero de iterações: ");
disp(k);

printf("\n erro final: %.6e\n", erro);
if  convergiu then
    printf("\n o metodo convergiu cdentro da tolerancia estabeleciada.\n");
else
    printf("\n atençãp: o metodo atingiu o numero maximo  de iterações sem convergir.\n")
end

printf("\n vetor solução do sistema:\n");
mprintf("  %.6f\n", X)

//...........................................
printf("\n verificação da solução, se ax = b\n\n")
//verificação dos resultados
for i = 1:n
    s = 0;
    for j = 1:n
        s = s + T(i,j) * X(j);
        if j < n then
            printf("(%.3f*%.3f) +  ", T(i,j), X(j));
        end
        if j == n then
            printf("(%.3f*%.3f) = ", T (i,j), X(j));
            printf("%.3f\n",s);
        end
    end
end

printf("\n fim de gauss-seidel");
