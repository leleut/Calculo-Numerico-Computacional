//funçao Regressiva_1a_ordem
//objetivo; aprox a 1a derivada usando formula de diferenças dinitaas regressiva de 1a ordem

//entradas;
// X : vetor com os valores dos nós
// Y : vetor com os valores da imagens
// k : índice do ponto onde será calculada a derivada
// derivada_1a_exata : valor exato da 1ª derivada (para erro percentual)
// derivada_2a_exata : valor exato da 2ª derivada (para erro de truncamento)

// Saídas: apenas impressão de resultados

function Regressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada_2a_exata)
    h = abs(X(k) - X(k-1));
    derivada_numerica = (Y(k) - Y(k-1)) / h;
    printf("\n==================================\n");
    printf(" Cálculo da derivada de 1a ordem em x = %g\n Pela fórmula Regressiva de 1a Ordem:\n\n", X(k));
    printf(" Aproximação: (f(xk) - f(xk-1)) / h\n");
    printf(" Computando: (%f - %f) / %f\n", Y(k), Y(k-1), h);
    printf(" Resultado: %f\n", derivada_numerica);
    Imprimir_Erro(derivada_1a_exata, derivada_numerica);
    Erro_Truncamento_R(h, derivada_2a_exata);
endfunction
