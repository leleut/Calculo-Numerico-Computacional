// ====================================================================
// Função Gauss
// Objetivo: Resolver sistemas lineares A.x = b usando  
//           eliminação de Gauss com susbituição retroativa.
// ====================================================================
// Entradas:
//   mat_vander: matriz dos coeficientes (geralmente de Vandermonde)
//   vetor Y: vetor dos termos independentes (valores de f(x))
// Saída:
//   COEF: vetor solução do sistema linear (coeficientes do polinômio)
// ====================================================================
// Observações:
//   - Esta versão da eliminação de Gauss NÃO utiliza pivoteamento.
//   - A função emite um alerta se a matriz estiver mal condicionada.
// ====================================================================
function [COEF] = Gauss(mat_vander, vetor_Y)
    n = length(vetor_Y);
    COEF = zeros(n, 1); // inicializa vetor solução
    U = mat_vander; // cópia da matriz para preservar original
    b = vetor_Y; // cópia do vetor independente
    
    // ================================================================
    // [0] Diagnóstico de Condicionamento Numérico
    // ================================================================
    cond_number = cond(U);
    if cond_number > 1e10 then
        warning("A matriz está mal condicionada (cond = " + ...
        msprintf("%.2e", cond_number) + "). Resultado pode ser instável.");
    end
    
    // ================================================================
    // [1] Etapa de Eliminação de Gauss (Triangularização)
    // ================================================================
    for k = 1:n-1
        if abs(U(k,k)) < %eps then
            error("Pivô nulo ou muito próximo de zero na linha "+string(k)+".");
        end
        for i = k+1:n
            m = U(i,k) / U(k,k);
            U(i,k) = 0;
            for j = k+1:n
                U(i,j) = U(i,j) - m * U(k,j);
            end
            b(i) = b(i) - m * b(k);
        end
    end
    
    // ================================================================
    // [2] Etapa de Substituição Retroativa
    // ================================================================
    for k = n:-1:1
        soma = 0;
        for j = k+1:n
            soma = soma + COEF(j) * U(k,j);
        end
        if abs(U(k,k)) < %eps then
            error("Divisão por zero na substituição retroativa.");
        end
        COEF(k) = (b(k) - soma) / U(k,k);
    end
endfunction
// ====================================================================
