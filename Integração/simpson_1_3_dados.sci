//função: simpson_1_3_dados
//objetivos: calcular a integral aproximada usando o methodo de simpson 1/3
// generalizaçao com dados tabulados

//entradas
//X: vetor com os valores dos nos (x_i)
//Y: vetor com os valores da imagens (f(x_i))
//integral_exata: valor da integral(para calcular calculo do erro percentual)

//saida apenas impressao dos resultados
function Simpson_1_3_Dados(X, Y, integral_exata)
    num_pontos = length(X);
    h = X(2) - X(1);
    printf("========================================================================\n");
    printf("INTEGRAÇAO NUMERICA METODO DE SIMPSON >1/3< GENERALIZADO (DADOS TABULADOS)\n");
    printf("========================================================================\n");
    printf(">Intervaldo de %g a %g com %d pontos igualmente espaçados: \n", X(1), X(num_pontos), num_pontos);
    printf(">Formula: I ~ (h/3) * [f(x0) + 4*SOMA(ímpares) + 2*SOMA(pares) + f(xn)]\n");
    somatorio_Pares = sum(Y(3:2:num_pontos-1));
    //-----------------------------------------------------------------------------------------------------
    somatorio_impares = sum(Y(2:2:num_pontos-1));
    integral_numerica = (h/3) * (Y(1) + 4*somatorio_impares + 2*somatorio_Pares + Y(num_pontos));
    //-----------------------------------------------------------------------------------------------------
    printf(">h = %f\n", h);
    printf(">Integral aproximada = %f\n", integral_numerica);
    erro_percentual = abs((integral_exata - integral_numerica) / integral_exata) * 100;
    printf(">Erro relativo percentual: %.6f %%\n", erro_percentual);
endfunction
    
