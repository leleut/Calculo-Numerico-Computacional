// ====================================================================
// Função: vander_matrix
// Objetivo: Gerar a matriz de Vandermonde associada ao vetor de nós X
// ====================================================================
// Entrada:
//   X: vetor com os valores dos nós (pontos x_i)
// Saída:
//   V: matriz de Vandermonde correspondente, de ordem n x n
// ====================================================================
// Observação:
//   A matriz de Vandermonde tem a forma:
//      V(i,j) = X(i)^(j-i)
//   Sendo usada para interpolação polinomial via sistema linear
//   Os valores de X deven ser distintos para que a matriz de Vandermonde
//   seja não singular no problema de interpolação
// ====================================================================
function V = vander_matrix(X)
    n = length(X); // número de pontos
    V = zeros(n,n); // inicializa matriz n x n
    for i = 1:n
        for j = 1:n
            V(i,j) = X(i)^(j - 1); // Potência crescente: 1, x, x^2...
        end
    end
endfunction
