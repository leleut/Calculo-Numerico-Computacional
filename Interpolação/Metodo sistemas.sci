///////////////////////////////////////////////////////////////////////
// INTERPOLAÇÃO POLINOMIAL POR SISTEMA LINEAR - Ver. MODULARIZADA
// ====================================================================
clc(); clear(); clf();
printf("\nINTERPOLAÇÃO POR SISTEMA DE EQUAÇÕES - Ver. MODULARIZADA\n");

// ====================================================================
// [0] Carregamento das Funções Modularizadas
// ====================================================================
// Gauss               // Resolução do sistema linear por elim. de Gauss
// vander_matrix       // Geração da matriz de Vandermonde
// avaliar_polinomio   // Avaliação do polinômio em um ponto
// plotar_interpolador // Geração do gráfico com pontos e polinômio
// ====================================================================
// Diretório do script principal
caminho = get_absolute_file_path("metodo-sistemas.sci");

// Carregamento das funções modularizadas
exec(caminho + "1-Gauss.sce", -1);
exec(caminho + "2-vander_matrix.sce", -1);
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
// [2] Montagem da Matriz de Vandermonde
// ====================================================================
Vander = vander_matrix(X);

printf("\n[2] MATRIZ DE VANDERMONDE:\n");
disp(Vander);

// ====================================================================
// [3] Resolução do sitema linear via Gauss
// ====================================================================
COEF =  Gauss(Vander, Y);
printf("\n[3] COEFICIENTES DO POLINÔMIO:\n");
for i = 1:n
    mprintf("   a%d = %.6f\n", i-1, COEF(i));
end

// ====================================================================
// [4] Construção do polinômio interpolador
// ====================================================================
Pol = poly(COEF, 'x', 'c');
printf("\n[4] POLINÔMIO INTERPOLADOR DE VANDERMONDE:\n");
disp(Pol);

// ====================================================================
// [5] Avaliação do polinômio em um ponto especifíco
// ====================================================================
// definição dos pontos e valores reais (podem ser vetores ou escalares)

pontos = [10, 14]
valores_ref = [%nan, %nan]




// ====================================================================
// Avaliação do ponto a ponto + funçõs de erro
for i = 1:length(pontos)
    ponto_i = pontos(i)
    valor_ref_i = valores_ref(i)
    
    if isnan(valor_ref_i) then
        [valor_aprox, erro_percentual] = avaliar_polinomio(Pol, ponto_i);
        printf("\n[5.%d] VALOR APROXIMADO: p_n(%.2f) = %.6f\n", i, ponto_i, valor_aprox);
        printf("[5.%d] ERRO PERCENTUAL: valor de referência não informado\n", i);
    else
        [valor_aprox, erro_percentual] = avaliar_polinomio(Pol, ponto_i, valor_ref_i);
        printf("\n[5.%d] VALOR APROXIMADO: p_n(%.2f) = %.6f\n", i, ponto_i, valor_aprox);
        printf("[5.%d] ERRO PERCENTUAL: %.4f%%\n", i, erro_percentual);
    end
end

// ====================================================================
// [6] Gráfico do polinômio interpolador
// ====================================================================
plotar_interpolador(X, Y, COEF, pontos);

printf("\n **** FIM DE INTERPOLAÇÃO POR SISTEMA DE EQUAÇÕES ****\n");
///////////////////////////////////////////////////////////////////////
