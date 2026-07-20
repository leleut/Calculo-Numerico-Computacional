//função: lagrange_2o_caso
//objetivo: aproximar a 1a derivada usando o polinomio de lagrange(2 caso)
//entradas:
//x: vetor com valores dos nos
//y: vetor com os valores das imagens
//k: indice do ponto onde será calculada a derivda
//deriva primeira exata: valor exaato da 1 derivada(para erro percentual)
//saidas : apenas impressão de resultados

function Lagrange_2o_caso(X,Y,k,derivada_1a_exata)
    h1 = abs(X(k+1) - X(k));
    h2 = abs(X(k) - X(k-1));
    h = h1 + h2;
    derivada_numerica = (Y(k+1) - Y(k-1)) / h;
    printf("\n==================================\n");
    printf("calculo da derivada 1a ordem em x = %g\n pelo metodo de lagrange - 2o caso:\n\n", X(k));
    printf("aproximação (f(xk+1) - (xk-1)) / (h1 + h2)\n");
    printf("computando :(%f - %f)/ %f\n", Y(k+1),Y(k-1), h);
    printf("resultado: %f\n", derivada_numerica);
    Imprimir_Erro(derivada_1a_exata, derivada_numerica);
endfunction
