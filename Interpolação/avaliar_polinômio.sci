// ====================================================================
// Função: avaliar_polinômio
// Objetivo: Avaliar um polinômio em um ou mais pontos e, opcionalmente,
//           calcular o erro percentual relativo se o valor de referência
//           for fornecido e numérico.
// ====================================================================
// Entradas: 
//    POL: polinômio interpolador (objeto polinomial)
//    ponto: escalar ou vetor com os pontos de avaliação
//    valor_ref: (opcional) valor real ou vetor de valores de referência
//                Se omitido ou não for numérico, o erro percentual não
//                é calculado
// Saídas:
//    valor_aprox: valores aproximados do polinômio nos pontos dados
//    erro_percentual: erro relativo percentual (%), ou vetor de NaNs
// ====================================================================
function [valor_aprox, erro_percentual] = avaliar_polinomio(POL, ponto, valor_ref)
    // avaliação por Horner (vetorizada)
    valor_aprox = horner(POL, ponto);
    
    // inicializa o erro como NaN, preservando o tamanho de valor_aprox
    erro_percentual = %nan * ones(valor_aprox);
    
    // cálculo do erro percentual apenas se: a função recebeu os 3 
    // argumentos de entradal; e valor_ref é numérico
    if argn(2) == 3 & typeof(valor_ref) == "constant" then
        
        // Caso 1: valor_ref é escalar (um único valor de referência)
        // Exemplo: comparar várias aproximações com um mesmo valor real
        // Nesse caso, a operação vetorizada é aplicada diretamente
        // a todos os elementos de valor_aprox
        if size(valor_ref, "*") == 1 then
            
            // o erro percentual relativo só é definido se o valor de referência
            // for diferente de zero
            if valor_ref <> 0 then
                erro_percentual = abs((valor_aprox - valor_ref) ./ valor_ref) * 100;
            end
               
        // Caso 2: valor_ref é vetor
        // Exemplo: cada aproximação possui seu próprio valor real
        else
            
            // Cria uma máscara lógica indicando as posições onde
            // valor_ref é diferente de zero, evitando divisão por zero
            idx = (valor_ref <> 0);
            
            // Calcula o erro percentual apenas nas posições válidas,
            // preservando NaN onde valor_ref = 0
            erro_percentual(idx) = ...
            abs((valor_aprox(idx) - valor_ref(idx)) ./ vetor_ref(idx)) * 100;
         end
    end
endfunction
// ====================================================================
