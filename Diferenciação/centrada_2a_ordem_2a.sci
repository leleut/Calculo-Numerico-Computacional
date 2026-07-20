//função: centrada_2a_ordem_2a
//onjetivo: aproximar a 2a derivada usando a formula centrada d 2a ordem
//entradas
//x: vetor com valores dos nos
//y: vetor com os valores das imagens
//k: indice do ponto onde será calculada a derivda
//derivada_2a_exata exata: valor exato da 2 derivada(para erro percentual)
//derivada_4a_exata: valor exato da 4 derivada(para erro truncamento

//saidas : apenas impressão de resultados

function Centrada_2a_ordem_2a(X,Y,k,derivada_2a_exata, derivada_4a_exata)
    h1 = abs(X(k +1) - X(k));
    h2 = abs(X(k) - X(k-1));
    h_prod = h1 * h2;
    derivada_numerica = (Y(k+1) - 2*Y(k) + Y(k-1)) / h_prod;
    printf("\n==================================\n");
    printf("calculo da derivadade 2a ordem em x = %g\n Pela formula centrada de 2a ordem:\n\n", X(k));
    printf("aproximação (f(xk+1) - 2*f(xk)) + f(xk-1)) /(h1 * h2)\n");
    printf("computando :(%f - 2*%f + %f) / %f\n", Y(k+1), Y(k), Y(k-1), h_prod);
    printf("resultado: %f\n", derivada_numerica);
    Imprimir_Erro(derivada_2a_exata, derivada_numerica);
    Erro_Truncamento_C22(h_prod, derivada_4a_exata); //verificar
endfunction
