////////////////////////////////////////////////////////////////////////
// AJUSTE POLINOMIAL POR MINIMOS QUADRADOS — LEITURA DE ARQUIVO CSV
//
// >>>>>>SOMENTE LE CSV, O OUTRO CODIGO LE DADOS MANUAIS<<<<<<<
//
// VERSÃO UNIVERSAL: lê qualquer .csv com duas colunas (X e Y),
// qualquer quantidade de dados, com cabeçalho na primeira linha.
//
// FORMATO ESPERADO DO CSV:
//   - Primeira linha: cabeçalho (qualquer nome, ex: "x,y")
//   - Demais linhas: pares de valores separados por vírgula
//   - Exatamente duas colunas
//   Exemplo:
//       x,y
//       1.3,2.0
//       3.4,5.2
////////////////////////////////////////////////////////////////////////

clear(); clc();         // se remover, sobroe os graficos
caminho = get_absolute_file_path("AjustePolinomialMQM_CSV.sci");
exec(caminho + "plotar_ajuste_polinomial.sci", -1);

printf("\n****** AJUSTE POLINOMIAL POR MÍNIMOS QUADRADOS (Dados CSV) ******\n");

//======================================================================
// [1] - Leitura do Arquivo CSV
//======================================================================
arquivo = input("Digite o nome do arquivo CSV (com extensão): ", "string");     // O ARQUIVO DEVE ESTAR NO MESMO DIRETÓRIO DOS CÓDIGOS

// Verifica se o arquivo existe; se não, tenta no diretório do script
if ~isfile(arquivo) then
    arquivo = caminho + arquivo;
    if ~isfile(arquivo) then
        error("Arquivo não encontrado: " + arquivo);
    end
end

// Lê o CSV inteiro como string para tratar o cabeçalho corretamente
dados_str = csvRead(arquivo, ",", [], "string");

// Valida que o arquivo tem exatamente duas colunas
if size(dados_str, 2) <> 2 then
    error("O arquivo deve conter exatamente duas colunas: X e Y.");
end

// Remove a primeira linha (cabeçalho) e converte para double
dados = evstr(dados_str(2:$, :));

X = dados(:, 1)';   // extrai coluna 1 como vetor linha → X
Y = dados(:, 2)';   // extrai coluna 2 como vetor linha → Y

//======================================================================
// [2] - Impressão da Tabela de Dados
//======================================================================
printf("\n[1] TABELA DE DADOS UTILIZADA NO AJUSTE (arquivo: %s):\n\n", arquivo);
for i = 1:length(X)
    printf("   x(%d) = %10.6f     y(%d) = %10.6f\n", i, X(i), i, Y(i));
end

//======================================================================
// [3] - Função: Ajuste Polinomial por Mínimos Quadrados
//======================================================================
function [Pol_ajuste, SSR, R2] = AjustePolinomialMQM(X, Y, ordem)
    n = length(X);
    grau = ordem + 1;
    aux = 0;

    //------------------------------------------------------------
    // [3.1] - Construcao da matriz do sistema normal
    //------------------------------------------------------------
    for i = 1:grau
        for j = 1:grau
            for k = 1:n
                aux = aux + (X(k).^((i-1)+(j-1)));
            end

            A(i,j) = aux;
            aux = 0;
        end
    end
    format("v", 9);
    printf("\n[2] MATRIZ DO SISTEMA NORMAL:\n");
    disp(A);

    //------------------------------------------------------------
    // [3.2] - Construcao do vetor dos termos independentes
    //------------------------------------------------------------
    aux = 0;
    for i = 1:grau
        for k = 1:n
            aux = aux + (X(k).^(i-1)) * Y(k);
        end
        B(i) = aux;
        aux = 0;
    end
    printf("\n[3] VETOR DOS TERMOS INDEPENDENTES:\n");
    disp(B);

    //------------------------------------------------------------
    // [3.3] - Resolucao do sist. linear
    //------------------------------------------------------------
    M = A \ B;
    printf("\n[4] COEFICIENTES DO POLINÔMIO DE AJUSTE:\n");
    disp(M);

    //------------------------------------------------------------
    // [3.4] - Construcao do poly ajustado
    //------------------------------------------------------------
    Pol_ajuste = poly(M, "x", "c");
    printf("\n[5] POLINÔMIO AJUSTADO POR MQM:\n");
    disp(Pol_ajuste);

    //------------------------------------------------------------
    // [3.5] - Avaliacao da qualidade do ajuste
    //------------------------------------------------------------
    [SSR, R2] = calcular_desvios(X, Y, Pol_ajuste);
endfunction

//======================================================================
// [4] - Função: Calculo dos Desvios e do Coeficiente R^2
//======================================================================
function [SSR, R2] = calcular_desvios(X, Y, polinomio)
    n = length(X);
    Ybar = sum(Y) / n;
    SSR = 0;            // soma dos quadrados dos resíduos
    SST = 0;            // soma dos quadrados totais
    for i = 1:n
        ajuste = horner(polinomio, X(i));

        res_i = (Y(i) - ajuste)^2;
        SSR = SSR + res_i;

        sst_i = (Y(i) - Ybar)^2;
        SST = SST + sst_i;
    end
    R2 = 1 - SSR / SST;

    printf("\n[6] QUALIDADE DO AJUSTE:\n");
    //printf("    Soma dos desvios quadráticos (SSR) = %.6f\n", SSR);
    printf("    Coeficiente de determinação R^2    = %.6f\n", R2);
endfunction

//======================================================================
// [5] - Escolha da ordem do polinomio
//======================================================================
// Informe a ordem conforme o comportamento dos dados:
//   Ordem 1 → linear    (dados apenas crescendo ou decrescendo)
//   Ordem 2 → quadrático (dados com um ponto de mínimo ou máximo)
//   Ordem 3 → cúbico    (dados com dois pontos de inflexão)
ORDEM = input("Informe a ordem do polinômio de ajuste (1, 2, 3, ...): ");

//======================================================================
// [6] - Execucao do ajuste
//======================================================================
[Pol_ajuste, SSR, R2] = AjustePolinomialMQM(X, Y, ORDEM);

//======================================================================
// [7] - Geracao do grafico
//======================================================================
plotar_ajuste_polinomial(X, Y, Pol_ajuste);

printf("\n******** FIM DO AJUSTE POLINOMIAL (REGRESSÃO) ********\n");
////////////////////////////////////////////////////////////////////////
