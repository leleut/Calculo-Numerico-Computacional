// ====================================================================
// Função: plotar_interpolador
// Objetivo: Gerar o gráfico do polinômio interpolador ajustado aos pontos (X,Y)
// ====================================================================
// Entradas:
//  X: vetor de abscissas dos pontos interpolados (xi)
//  Y: vetor de ordenadas dos pontos interpolados (yi)
//  COEF: vetor de coeficientes do polinômio (do termo constante ao de maior grau)
//        ou diretamente o polinômio simbólico (tipo poly)
//  pontos_interp: vetor de pontos nos quais o polinômio será destacado
// ====================================================================
// Observações:
//  - A função detecta automaticamente se COEF já é um polinômio simbólico
//  - O gráfico exibe os pontos originais (vermelhos), a curva ajustada (azul),
//    e os pontos destacados (quadrados vermelhos)
//  - O título reflete a natureza da interpolação
// ====================================================================
function plotar_interpolador(X, Y, COEF, pontos_interp)
    // se COEF já for um polinômio simbólico, extrai os coeficientes
    if typeof(COEF) == "polynomial" then
        COEF = coeff(COEF);
    end
    
    // constrói o polinômio na forma simbólico a partir does coeficientes
    Pol = poly(COEF, 'x', 'c');
    
    // gera pontos para traçar a curva suavemente (com margem de 5%)
    x_min = min(X);
    x_max = max(X);
    delta = 0.05 * (x_max - x_min);
    xx = linspace(x_min - delta, x_max + delta, 300);
    yy = horner(Pol, xx);
    yy_interp = horner(Pol, pontos_interp);
    
    // título e rótulos genéricos (ajustáveis)
    titulo = "Polinômio Interpolador p_n(x)";
    rotulo_x = "Valores tabulados: vetor X";
    rotulo_y = "Valores tabulados: vetor Y";
    
    // geração do gráfico
    clf();
    plot(X, Y, 'ro', xx, yy, 'b', pontos_interp, yy_interp, 'rs', 'LineWidth', 3.5);
    xgrid();
    
    // titulos e eixos
    xtitle(titulo, rotulo_x, rotulo_y);
    
    // legenda -- ordem precisa respeitar a camada ao 'plot'
    legend(["Dados", "p_n(X)", "Pontos Interpolados"], "in_upper_left");
    
    // ajustes visuais (melhor legibilidade)
    a = gca()
    a.title.font_size = 4.5;
    a.x_label.font_size = 4.5;
    a.y_label.font_size = 4.5;
endfunction
// ====================================================================
