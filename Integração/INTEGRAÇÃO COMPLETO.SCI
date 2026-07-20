//https://www.wolframalpha.com/input?i=integrate
//-------------------------------------------------
//script: INTEGRACAO_COMPLETO.SCI
//
clear; clc;

printf("===========================================\n");
printf("===INTEGRAÇAO NUMERICA - MODULO COMPLETO===\n");
printf("===========================================\n");
//carregando as funçoes
caminho = get_absolute_file_path("INTEGRACAO_COMPLETO.sci");
exec(caminho + "trapezio_funcao.sci", - 1);
exec(caminho + "trapezio_dados.sci", - 1);
exec(caminho + "simpson_1_3_dados.sci", - 1);
exec(caminho + "simpson_3_8_dados.sci", - 1);
//===========================================
//dados para problemas com tabelas

X = [0,1,2,3,4,5,6];
Y = [5.04,5.93,12.08,26.01,44.91,70.21,100.87];

deff('y = f(x)', 'y = 5-2*x+3*x^2'); //funçao fornecida no ex
//deff('y = f(x)', 'y = 5.04 +5.0598333*x -11.255861*x^2 +9.63125*x^3 -2.9415278*x^4 +0.4189167*x^5 -0.0226111*x^6'); //funçao obtida do methodo sistemas
//deff('y = f(x)', 'y = 4.92119 -2.15*x +3.030238*x^2');//obtida do ajuste

x0 = 0.0;//primeiro
xn = 6.0;//ultimo
integral_exata = 210.000000 ;//integral com apox pol via math
//integral_exata = 210.021049;//integral via interp. sistemas  via math
//integral_exata = 209.004276;//integral via ajuste  via math
n= 1000;//numero de subintervalos para o methodo do trapezio com funçao analitica



//------------------------------------------------------
//======================================================
//execucao dos metodos com dados taulados + funçao
//======================================================
printf("====================================================");
printf("\n> metodo do trapezio generalizado (dados tabulados) <\n");
printf("====================================================\n");
Trapezio_Dados(X, Y, integral_exata);
//printf("\n>>> methodo de simpson 1/3 generalizado (dados tabulados)\n");
Simpson_1_3_Dados(X, Y, integral_exata);
//printf("\n>>> methodo de simpson 3/8 generalizado (dados tabulados)\n");
Simpson_3_8_Dados(X, Y, integral_exata);
//printf("\n>>> methodo do trapezio (funçao analitica)\n");
Trapezio_Funcao(f, x0, xn, n, integral_exata);

printf("\n===============fim da integracao numerica===============\n");
