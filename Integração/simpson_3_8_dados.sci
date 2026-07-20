//função: simpson_3_8_dados
//objetivos: calcular a integral aproximada usando o methodo de simpson 3/8
// generalizaçao com dados tabulados

//entradas
//X: vetor com os valores dos nos (x_i)
//Y: vetor com os valores da imagens (f(x_i))
//integral_exata: valor da integral(para calcular calculo do erro percentual)

//saida apenas impressao dos resultados
function Simpson_3_8_Dados(X, Y, integral_exata)
    num_pontos = length(X);
    h = X(2) - X(1);
    printf("========================================================================\n");
    printf("INTEGRAÇAO NUMERICA METODO DE SIMPSON >3/8< GENERALIZADO (DADOS TABULADOS)\n");
    printf("========================================================================\n");
    printf(">Intervaldo de %g a %g com %d pontos igualmente espaçados\n", X(1), X(num_pontos), num_pontos);
    printf(">Formula: I ~ (3*h/8) * [f(x0) + 3*Σ grupo + 2*Σ grupo2 + f(xn)]\n");
   
    //-----------------------------------------------------------------------------------------------------
   somatorio1 = 0;
   somatorio2 = 0;
   for i = 2:3:num_pontos-1
         somatorio1 = somatorio1 + Y(i) + Y(i+1);
   end
   //grupo 2: indices multiplos de 3
    for i = 4:3:num_pontos-1
            somatorio2 = somatorio2 + Y(i);
    end
    integral_numerica = (3*h/8) * (Y(1) + 3*somatorio1 + 2*somatorio2 + Y(num_pontos));
    //-----------------------------------------------------------------------------------------------------
    printf(">h = %f\n", h);
    printf(">Integral aproximada = %f\n", integral_numerica);
    erro_percentual = abs((integral_exata - integral_numerica) / integral_exata) * 100;
    printf(">Erro relativo percentual: %.6f %%\n", erro_percentual);
endfunction
    
