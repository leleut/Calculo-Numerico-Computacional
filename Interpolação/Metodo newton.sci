///////////////////////////////////////////////////////////////////////
// INTERPOLAÇÃO POLINOMIAL POR NEWTON - Ver. MODULARIZADA
// ====================================================================
clc(); clear(); clf();
printf("\n** INTERPOLAÇÃO POR NEWTON - Ver. MODULARIZADA **\n");

// ====================================================================
// [0] Carregamento das Funções Modularizadas
// ====================================================================
// dif_divididas       // Obter as diferenças divididas necessárias
// newton_poly         // Geração do polinômio interpolador
// avaliar_polinomio   // Avaliação do polinômio em um ponto
// plotar_interpolador // Geração do gráfico com pontos e polinômio
// ====================================================================
// Diretório do script principal
caminho = get_absolute_file_path("metodo-newton.sci");

// Carregamento das funções modularizadas
exec(caminho + "4-dif_divididas.sci", -1);
exec(caminho + "5-newton_poly.sci", -1);
exec(caminho + "avaliar_polinomio.sce", -1);
exec(caminho + "plotar_interpolador.sce", -1);

// ====================================================================
// [1] Entrada de dados
// ====================================================================


X = [4,8,12,16,20]
Y = [81,57,46,39,35]


// ====================================================================
n = length(X); // numero de pontos
printf("\n[1] TABELA DE DADOS:\n");
for i = 1:n
    printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i));
end

// ====================================================================
// [2] Cálculo do Coeficientes via Diferenças divididas
// ====================================================================
coef = dif_divididas(X, Y);
printf("\n[2] COEFICIENTES DAS DIFERENÇAS DIVIDIDAS:\n");
disp(coef);

// ====================================================================
// [3] Construção do Polinômio de Newton
// ====================================================================
PolNewton = newton_poly(X, coef);
printf("\n[3] POLINÔMIO INTERPOLADOR POR NEWTON:\n");
disp(PolNewton);

// ====================================================================
// [4] Exibição do Polinômio interpolador
// ====================================================================
// definição dos pontos e valores reais (podem ser vetores ou escalares)


pontos = [10, 14]
valores_ref = [%nan, %nan]


// ====================================================================
// [5] Avaliação do polinômio em pontos especifícos
// ====================================================================
// Avaliação do ponto a ponto + funçõs de erro
for i = 1:length(pontos)
    ponto_i = pontos(i)
    valor_ref_i = valores_ref(i)
    
    if isnan(valor_ref_i) then
        [valor_aprox, erro_percentual] = avaliar_polinomio(PolNewton, ponto_i);
        printf("\n[4.%d] VALOR APROXIMADO: p(%.2f) = %.6f\n", i, ponto_i, valor_aprox);
        printf("[4.%d] ERRO PERCENTUAL: valor de referência não informado\n", i);
    else
        [valor_aprox, erro_percentual] = avaliar_polinomio(PolNewton, ponto_i, valor_ref_i);
        printf("\n[4.%d] VALOR APROXIMADO: p(%.2f) = %.6f\n", i, ponto_i, valor_aprox);
        printf("[4.%d] ERRO PERCENTUAL: %.4f%%\n", i, erro_percentual);
    end
end

// ====================================================================
// [5] Gráfico do polinômio interpolador
// ====================================================================
plotar_interpolador(X, Y, PolNewton, pontos);

printf("\n **** FIM DE INTERPOLAÇÃO POR NEWTON ****\n");
///////////////////////////////////////////////////////////////////////
