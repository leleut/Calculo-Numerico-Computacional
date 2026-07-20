// ====================================================================
// Função: newton_poly
// Objetivo: Construir o polinômio interpolador de Newton a partir dos 
//           coeficientes obtidos por diferenças divididas
// ====================================================================
// Entradas:
//  X: vetor com as abscissas dos pontos (x_1, x_2, ..., x_n)
//  coef: vetor com os coeficientes das diferenças divididas,
//        na ordem correta (coef(1) = a_0, coef(2) = a_1, ...)
// ====================================================================
// Saída:
//  P: polinômio interpolador completo (objeto do tipo 'poly')
// ====================================================================
// Observações:
// O polinômio é construído na forma de Newton:
//  P(x) = a_0 + a_1(x - x_0) + a_2(x - x_0)(x - x_1) + ...
// ====================================================================
function P = newton_poly(X, coef)
    // ================================================================
    // [1] Inicializações
    // ================================================================
    n = length(X);
    x = poly(0, "x"); // variável simbólica
    P = coef(1); // termo constante (a_0)
    termo = 1; // acumulador do produto (x - x0)(x - x1)...
    
    // ================================================================
    // [2] Construção do polinômio
    // ================================================================
    for i = 2:n
        termo = termo * (x - X(i - 1));
        P = P + coef(i) * termo;
    end
endfunction
///////////////////////////////////////////////////////////////////////
