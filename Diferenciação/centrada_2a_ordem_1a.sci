//função: centrada_2a_ordem_1a
//onjetivo: aproximar a 1a derivada usando a formula centrada d 2a ordem
//entradas
//x: vetor com valores dos nos
//y: vetor com os valores das imagens
//k: indice do ponto onde será calculada a derivda
//deriva primeira exata: valor exato da 1 derivada(para erro percentual)
//deriva terceira exata: valor exato da 3 derivada(para erro truncamento
//saidas : apenas impressão de resultados

function Centrada_2a_ordem_1a(X,Y,k,derivada_1a_exata, derivada_3a_exata)
    h1 = abs(X(k +1) - X(k));
    h2 = abs(X(k) - X(k-1));
    h = h1 + h2;
    derivada_numerica = (Y(k+1) - Y(k-1)) / h;
    printf("\n==================================\n");
    printf("calculo da derivadade 1a ordem em x = %g\n Pela formula progressiva de 2a ordem:\n\n", X(k));
    printf("aproximação (f(xk+1) - f(xk-1)) (h1 + h2)\n");
    printf("computando:(%f - %f) / %f\n", Y(k+1), Y(k-1), h);
    printf("resultado: %f\n", derivada_numerica);
    Imprimir_Erro(derivada_1a_exata, derivada_numerica);
    Erro_Truncamento_C21(h/2, derivada_3a_exata); //verificar
endfunction
