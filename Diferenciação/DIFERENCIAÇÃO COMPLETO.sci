//scrip pincipal: DIFERENCAÇÃO_COMPLETA.sci
clear; clc;

printf("////////// DIFERENCIAÇÃO numerica COMPLETA /////////\n");
//carregamento das funcoes modulares
caminho = get_absolute_file_path("DIFERENCIAÇÃO_COMPLETO.sci");
// ====================================================================
exec(caminho + "Progressiva_1a_Ordem.sci", -1);
exec(caminho + "Regressiva_1a_Ordem.sci", -1);
exec(caminho + "Centrada_2a_ordem_1a.sci", -1);
exec(caminho + "Centrada_2a_ordem_2a.sci", -1);
exec(caminho + "Lagrange_1o_Caso.sci", -1);
exec(caminho + "Lagrange_2o_caso.sci", -1);
exec(caminho + "Lagrange_3o_caso.sci", -1);
exec(caminho + "Imprimir_Erro.sci", -1);
exec(caminho + "Erro_Truncamento.sci", -1);
// ====================================================================
// ====================================================================
//entrada de dados
// ====================================================================
//exemplo

X = [1300, 1400, 1500, 1600, 1700]   // tráfego (pacotes/s)
Y = [23.75, 26.00, 28.50, 31.25, 34.25]  // latência (ms)
k = 3   // ponto de interesse x = 1500


// ====================================================================
//derivadas exatas no ponto de interresse = x.exp(x)
// ====================================================================
//exemplo


x = X(k);
derivada_1a_exata = 0.00002 * x;
derivada_2a_exata = 0.00002; 
derivada_3a_exata = 0;
derivada_4a_exata = 0;



// ====================================================================
//execuçao dos metodos
// ====================================================================

printf("\n>>> progressiva 1a ordem: \n");
Progressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada_2a_exata);
printf("\n>>> regressiva 1a ordem: \n");
Regressiva_1a_Ordem(X, Y, k, derivada_1a_exata, derivada_2a_exata);
printf("\n>>> centrada 2a ordem (1a derivada): \n");
Centrada_2a_ordem_1a(X, Y, k, derivada_1a_exata, derivada_3a_exata);
printf("\n>>> centrada 2a ordem (2a derivada): \n");
Centrada_2a_ordem_2a(X, Y, k, derivada_2a_exata, derivada_4a_exata);
printf("\n>>> lagrange 1o caso: \n");
Lagrange_1o_Caso(X, Y, k, derivada_1a_exata);
printf("\n>>> lagrange 2o caso: \n");
Lagrange_2o_caso(X, Y, k, derivada_1a_exata);
printf("\n>>> lagrange 3o caso: \n");
Lagrange_3o_caso(X, Y, k, derivada_1a_exata);
printf("//////////////////////fim da diferenciação numerica/////////////////////\n");
