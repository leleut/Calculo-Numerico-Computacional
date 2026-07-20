//scrip main completo
//
clear; clc;

printf("\n===========================================================\n");
printf("\n=============EDOs - problema de valor inicial =============\n");
printf("\n===========================================================\n");

caminho = get_absolute_file_path("PVI_EDO_COMPLETO.sci");
exec(caminho + "euler_1a_ordem.sci", -1);
exec(caminho + "euler_modificado.sci", -1);
exec(caminho + "taylor_2a_ordem.sci", -1);
exec(caminho + "rk3_3a_ordem.sci", -1);
exec(caminho + "rk4_4a_ordem.sci", -1);
exec(caminho + "plotar_resultado_aproximado.sci", -1);
//======================================================


a = 0.0; b = 1.0;//a lim inferior // b do lim inf ate o sup
x0 = a; y0 = 50.0;//x0 lim infe //y0 cond inicial
k = 1.5; Rmax = 200;
//dy = k*(Rmax-y);
//d2y = -k^2*(Rmax-y);
//yex = Rmax-(Rmax-y0)*exp(-k*x);
h = 0.01;
n = round((b-a)/h);
//======================================================
function dy = f(x,y)
  dy = k*(Rmax-y);
endfunction

function d2y = df(x,y)
  d2y = -k^2*(Rmax-y);
endfunction

function yex = y_exata(x)
  yex = Rmax-(Rmax-y0)*exp(-k*x);
endfunction





//======================================================
[x1, y1] = euler_1a_ordem(f, x0, y0, h, n);
[x2, y2] = euler_modificado(f, x0, y0, h, n);
[x3, y3] = taylor_2a_ordem(f, df, x0, y0, h, n);
[x4, y4] = rk3_3a_ordem(f, x0, y0, h, n);
[x5, y5] = rk4_4a_ordem(f, x0, y0, h, n);
//======================================================

yex = y_exata(x1);

//======================================================
//calculo dos erros
//======================================================
printf("\n\n================== erros finais em N(6.0) ==================\n");
mprintf(" passo h = %.4f | n = %d | ponto final efetivo = %.6f\n", h, n, x1($));
mprintf(" metodo                  N(6.0)           erro relativo (%%)\n");
mprintf("-------------------------------------------------------\n");
mprintf(" euler_1a_ordem        %9.6f          %10.6f\n", y1($), 100* abs((y1($)- yex($))/yex($)));
mprintf(" euler_modificado      %9.6f          %10.6f\n", y2($), 100* abs((y2($)- yex($))/yex($)));
mprintf(" taylor_2a_ordem       %9.6f          %10.6f\n", y3($), 100* abs((y3($)- yex($))/yex($)));
mprintf(" rk3_3a_ordem          %9.6f          %10.6f\n", y4($), 100* abs((y4($)- yex($))/yex($)));
mprintf(" rk4_4a_ordem          %9.6f          %10.6f\n", y5($), 100* abs((y5($)- yex($))/yex($)));
mprintf("-------------------------------------------------------\n");
mprintf(" solução_exata                %9.6f\n", yex($));
mprintf("===========================================================\n\n");
//======================================================
//grafico comparativo
//======================================================
clf();
plot(x1, y1, 'r-o', x2, y2, 'g-x', x3, y3, 'm-+', x4, y4, 'c-s', x5, y5, 'b-*', x1, yex, 'k--');

xgrid(1);
xtitle("Comparacao de metodos para o PVI:Tamanho medio de fila", "tempo(min)", "Quantidade media de tarefas na fila N(t)");//nome//x 2o//y1o
legend(["euler_1a_ordem", "euler_modificado", "taylor_2a_ordem", "rk3_3a_ordem", "rk4_4a_ordem", "solucao_exata"], 2);
