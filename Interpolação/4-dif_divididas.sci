// ====================================================================
// Função: dif_divididas
// Objetivo: Calcular os coeficientes da interpolação polinomial de Newton 
//           usando o método das Diferenças Divididas
// ====================================================================
// Entradas:
//  X: vetor com as abscissas dos pontos (x_1, x_2, ..., x_n)
//  Y: vetor com os valores da função nos pontos (f(x_1), ..., f(x_n))
// ====================================================================
// Saída:
//  coef: vetor com os coeficientes da forma de Newton, correspondentes
//        aos termos sucessivos do polinômio
// ====================================================================
// Observações:
// O vetor Y é reutilizado para contruir a tabela de diferenças divididas
// e retorna como o vetor coef com os termos da forma de Newton
// ====================================================================
function coef = dif_divididas(X, Y)
    // ================================================================
    // [1] Inicializações
    // ================================================================
    n = length(X);
    coef = Y; // 1 coluna da tabela de diferenças divididas
    
    // ================================================================
    // [2] Construção da tabela (diferenças superiores)
    // ================================================================
    for j = 2:n
        for i = n:-1:j
            coef(i) = (coef(i) - coef(i-1)) / (X(i) - X(i-j+1));
        end
    end
endfunction
