
// INTERPOLAÇÃO POLINOMIAL POR LAGRANGE - Ver. MODULARIZADA
// ====================================================================
clc(); clear(); clf();
printf("\n INTERPOLAÇÃO PELO MÉTODO DE LAGRANGE - Ver. MODULARIZADA *\n");

// ====================================================================
// [0] Carregamento das Funções Modularizadas
// ====================================================================
// lagrange_poly       // Cálculo do polinômio e termos de base de lagrange
// avaliar_polinomio   // Avaliação do polinômio em um ponto
// plotar_interpolador // Geração do gráfico com pontos e polinômio
// ====================================================================
// Diretório do script principal
caminho = get_absolute_file_path("metodo-lagrange.sci");

// Carregamento das funções modularizadas
exec(caminho + "3-lagrange_poly.sce", -1);
exec(caminho + "avaliar_polinomio.sce", -1);
exec(caminho + "plotar_interpolador.sce", -1);

// ====================================================================
// [1] Entrada de dados
// ====================================================================

X = [4,8,12,16,20]
Y = [81,57,46,39,35]


n = length(X); // numero de pontos
printf("\n[1] TABELA DE DADOS:\n");
for i = 1:n
    printf("   x = %.6f; f(x) = %.6f\n", X(i), Y(i));
end

// ====================================================================
// [2] Cálculo do Polinômio de Lagrange
// ====================================================================
[PolLagrange, BaseLagrange] = lagrange_poly(X, Y);

printf("\n[2] POLINÔMIOS DE BASE DE LAGRANGE:\n");
for i = 1:n
    pol_str = pol2str(BaseLagrange(i)); // converte o polinômio para string
    printf("   L_%d(x) = %s\n", i - 1, pol_str);
end

// ====================================================================
// [3] Exibição do Polinômio interpolador
// ====================================================================
// definição dos pontos e valores reais (podem ser vetores ou escalares)
 

pontos = [10, 14]
valores_ref = [%nan, %nan]



printf("\n[3] POLINÔMIO INTERPOLADOR POR LAGRANGE:\n");
disp(PolLagrange);

// ====================================================================
// [4] Avaliação do polinômio em pontos especifícos
// ====================================================================
// Avaliação do ponto a ponto + funçõs de erro
for i = 1:length(pontos)
    ponto_i = pontos(i)
    valor_ref_i = valores_ref(i)
    
    if isnan(valor_ref_i) then
        [valor_aprox, erro_percentual] = avaliar_polinomio(PolLagrange, ponto_i);
        printf("\n[4.%d] VALOR APROXIMADO: p(%.2f) = %.6f\n", i, ponto_i, valor_aprox);
        printf("[4.%d] ERRO PERCENTUAL: valor de referência não informado\n", i);
    else
        [valor_aprox, erro_percentual] = avaliar_polinomio(PolLagrange, ponto_i, valor_ref_i);
        printf("\n[5.%d] VALOR APROXIMADO: p(%.2f) = %.6f\n", i, ponto_i, valor_aprox);
        printf("[5.%d] ERRO PERCENTUAL: %.4f%%\n", i, erro_percentual);
    end
end

// ====================================================================
// [5] Gráfico do polinômio interpolador
// ====================================================================
plotar_interpolador(X, Y, PolLagrange, pontos);

printf("\n **** FIM DE INTERPOLAÇÃO POR LAGRANGE ****\n");
///////////////////////////////////////////////////////////////////////
