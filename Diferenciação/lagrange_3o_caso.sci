//função: lagrange_3o_caso
//objetivo: aproximar a 1a derivada usando o polinomio de lagrange(3 caso)
//formula assimtrica regressiva de ordem 2 (3 pontos para tras)
//entradas:
//x: vetor com valores dos nos
//y: vetor com os valores das imagens
//k: indice do ponto onde será calculada a derivda
//derivada_1a_exata: valor exato da 1 derivada(para erro percentual)
//saidas : apenas impressão de resultados

function Lagrange_3o_caso(X, Y, k, derivada_1a_exata)
    h1 = abs(X(k-2) - X(k-1));
    h2 = abs(X(k-1) - X(k));
    h = h1 + h2;
    derivada_numerica = (3*Y(k) - 4*Y(k-1) + Y(k-2))/h;
    printf("\n==================================\n");
    printf("calculo da derivada 1a ordem em x = %g\n Pelo metodo de lagrange - 3o caso:\n\n", X(k));
    printf("aproximação (3*f(xk) - 4*f(xk-1) + f(xk-2)) / h \n");
    printf("computando :(%f - %f)/ %f\n", Y(k),Y(k-1), h);
    printf("resultado: %f\n", derivada_numerica);
    Imprimir_Erro(derivada_1a_exata, derivada_numerica);
endfunction
