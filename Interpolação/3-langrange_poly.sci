// ====================================================================
// Função: langrange_poly
// Objetivo: Construir o polinômio interpolador por Lagrange
// ====================================================================
// Entradas: 
//  X: vetor com as abscissas dos nós de interpolação (x_i)
//  Y: vetor com os valores da função nos nós (y_i = f(x_i))
// ====================================================================
// Saídas:
// PolLagrange: polinômio interpolador completo (objeto do tipo 'poly')
// BaseLagrange: lista com os n polinômios da base L_i(x) de Lagrange
//               (objetos do tipo 'poly'), para i = 0, ..., n-1
// ====================================================================
// Observações:
// O polinômio interpolador obtido é p_n(x) = soma[L_i(x)*y_i],i = 0,...,n-1
// ====================================================================
function [PolLagrange, BaseLagrange] = lagrange_poly(X, Y)
    // ================================================================
    // [1] Inicializações
    // ================================================================
    n = length(X); // número de pontos
    x = poly(0, "x"); // variável simbólica
    PolLagrange = 0; // polinômio final
    BaseLagrange = list(); // lista para armazenar os L_i(x)
    
    // ================================================================
    // [2] Construção dos termos de base L_i(x) e soma ponderada
    // ================================================================
    for i = 1:n
        Li = 1; // inicia o termo da base L_i(x)
        for j = 1:n
            if j <> i then
                Li = Li * (x - X(j)) / (X(i) - X(j)); // produto para j <> i
            end
         end
         BaseLagrange(i) = Li; // aramazena L_i(x)
         PolLagrange = PolLagrange + Li * Y(i); // soma ponderada por y_i
    end
endfunction
///////////////////////////////////////////////////////////////////////
