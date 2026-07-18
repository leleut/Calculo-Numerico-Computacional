clear(); clc();

printf("\n Método Iterativo de Gaus Jacobi\n");
printf("Resolução iterativa de sistemas lineares \n");
// Dados de entrada - Matriz dos coeficientes e vetor dos termos independentes


A = [-0.1,-0.2,1,0.2;
    0.6,3,-0.6,-0.3;
    2,1,-0.2,0.2;
    0.4,1.2,-0.8,4]
B = [1;-7.8;0.4;-10]



 printf("\n Dados de entrada matriz A e vetor B\n");
 printf("\nEntrada Matriz A (original)");
 disp(A);
 printf("\nEntrada Matriz B (original)");
 disp(B);
 
 n = length(B);
 Nmax = 1100;
 epsilon = 1.0e-6;
 X0 = [0; 0; 0; 0];
 X = X0;
 T = A;
 
 //Verificação de pivos nulos na diagonal principal
 for i = 1:n
     if A(i,i) == 0 then
         error("ERRO: elemento nulo na diagonal prinipal.");
     end
 end
 
 printf(" Processo Iterativo:\n");
 
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

printf("\n Número de iterações");
disp(k);

printf("\n Erro final: %.6e\n", erro);

if convergiu then
    printf("\n O método convergiu dentro da tolerância estabelecida\n");
else
    printf("\n  ATENÇAÕ: o método atingiu o numero máximo de iterações sem covergir\n");
end

printf("\n Vetor solução do sistema\n");
mprintf("  %.6f\n", X);

printf("\n Verificação da soluçao, se AX = B *****:\n\n");

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


