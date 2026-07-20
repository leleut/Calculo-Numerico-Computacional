//funçao Lagrange_1o_caso
//objetivo; aprox a 1a derivada usando polinomio de lagrange (1o caso)
//formula assimetrica progressiva de ordem 2 (3 pontos a frente)

//entradas;
// X : vetor com os valores dos nós
// Y : vetor com as imagens
// K ; indice do ponto onde ser calculado a derivada
// derivada_1a_exata : valor exato da 1a derivada (para erro ercentual)

//saida: impressão do resultado

function Lagrange_1o_Caso(X, Y, k, derivada_1a_exata)
    h1= abs(X(k) - X(k+1));
    h2= abs(X(k+1) - X(k+2));
    h = h1 + h2;
    derivada_numerica = (-3*Y(k) + 4*Y(k+1) - Y(k+2)) / h;
    printf("\n==================================\n");
    printf("calculo da derivada de 1a ordem em x = %g\n Pelo metodo de lagrange de 1o caso\n\n", X(k));
    printf("aproximação: (-3*%f + 4*%f - %f) - %f\n", Y(k), Y(k+1), Y(k+2), h);
    printf("resultado: %f\n", derivada_numerica);
    Imprimir_Erro(derivada_1a_exata, derivada_numerica);
endfunction
