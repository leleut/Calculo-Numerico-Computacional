//funçao: trapezio_funcao
//objetivo: calcular a integral aproximada usando o methodo do trapezio
//com avaliçao ireta da funçao
//-----------------------------------------------------------------------------
//entradas
//f: funçao a ser integrada
//x0: limite inferior da integraçao
//xn: limite superior da integraçao
//n: numero de subintervalos (quanto maior, mais precisa a aproximaçao)
//integral_exata: valor da integral(para calcular calculo do erro percentual)
//-----------------------------------------------------------------------------
//saida apenas impressao dos resultados
function Trapezio_Funcao(f, x0, xn, n, integral_exata)
    h = (xn - x0) / n;
    soma_interna = 0;
    for i = 1:n-1
       soma_interna = soma_interna + f(x0 + i*h);
    end
    integral_numerica = (h/2) * (f(x0) + 2*soma_interna + f(xn));
    printf("====================================================================\n");
    printf("INTEGRAÇAO NUMERICA METODO DO TRAPEZIO 1000 inter.(FUNCAO ANALITICA)\n");
    printf("====================================================================\n");
    printf(">Intervaldo de %g a %g com %d subintervalos\n", x0, xn, n);
    printf(">Integral aproximada = %f\n", integral_numerica);
    erro_percentual = abs((integral_exata - integral_numerica) / integral_exata) * 100;
    printf(">erro relativo percentual: %.6f %%\n", erro_percentual);
    endfunction
