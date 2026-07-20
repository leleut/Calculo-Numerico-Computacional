//funçao progressiva_1a_ordem
//objetivo; aprox a 1a derivada usando formula de diferenças dinitaas progressivas de 1a ordem

//entradas;
// X : vetor com os valores dos nós
// Y : vetor com os valores da imagens
// K ; indice do ponto onde ser calculado a derivada
// derivada_1a_exata : valor exato da 1a derivada (para erro ercentual)
// derivada_2a_exata : calor exato da 2a derivada (para erro de truncamento)

//saida: impressão do resultado

function Progressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada_2a_exata)
    h= abs(X(k+1) - X(k));
    derivada_numerica = (Y(k+1) - Y(k)) / h;
    printf("\n==================================\n");
    printf("calculo da derivada de 1a ordem em x = %g\n Pela formula progressiva de 1a ordem\n\n", X(k));
    printf("aproximação: (f(xk+1) - f(xk) / h \n");
    printf("computação: (%f - %f) / %f\n ", Y(k+1), Y(k), h);
    printf("resultado: %f\n", derivada_numerica);
    Imprimir_Erro(derivada_1a_exata, derivada_numerica);
    Erro_Truncamento_P(h, derivada_2a_exata);
endfunction
