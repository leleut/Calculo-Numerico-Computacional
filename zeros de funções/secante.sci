clear(); clc(); 

printf("*************Metodo da Secante*************\n");

deff('y = f(x)', 'y = x.^3-9*x+3')
x_antes0 = 0.0
x_antes1 = 1.0
epsilon1 = 1e-06
epsilon2 = 1e-06
k=0
nmax = 100

k=0
nmax = 100
x_atual = x_antes1-f(x_antes1)*(x_antes1-x_antes0)/(f(x_antes1)- f(x_antes0)) //expressa as interaçoes

printf("  K |    xk    | abs(xk-x1)|    f(xk)  |\n")
while (k<nmax) & (abs(x_atual - x_antes1) > epsilon1) & (abs(f(x_atual))> epsilon2)
    x_antes0 = x_antes1
    x_antes1 = x_atual
    x_atual = x_antes1-f(x_antes1)*(x_antes1-x_antes0)/(f(x_antes1)- f(x_antes0))
    k = k + 1
    printf("%2i |%10.6f |%10.6f|%10.6f|\n", k, x_atual, abs(x_atual-x_antes1), f(x_atual))
end
printf("aprox. ""%8.6f"" a raiz, com ""%2i"" interaçoes\n", x_atual, k)
// Verificação
//printf("Verificacao: f(%.6f) = %.10f\n", x_atual, f(x_atual));
