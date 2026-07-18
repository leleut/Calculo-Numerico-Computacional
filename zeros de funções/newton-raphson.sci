clear(); clc(); 

printf("********metodo newton-raphson********\n");


deff('y = f(x)', 'y = x.^3-9*x+3')
deff('y = f1(x)', 'y=3*x^2-9')
x_antes=0.5
epsilon1 = 1e-06
epsilon2 = 1e-06
k=0
nmax = 100


k=0
nmax = 100
x_atual = x_antes-f(x_antes)/f1(x_antes) //expressa as interaçoes
//////
printf("  K |    xk    | abs(xk-x0)|    f(xk)  |   f1(xk)  |\n")
while (k<nmax) & (abs(x_atual - x_antes) > epsilon1) & (abs(f(x_antes))> epsilon2)
    x_antes = x_atual
    x_atual = x_antes-f(x_antes)/f1(x_antes)
    k = k + 1
    printf("%2i |%10.6f |%10.6f |%10.6f|%10.6f|\n", k,...
        x_atual, abs(x_atual-x_antes), f(x_antes), f1(x_antes))
end
printf("aprox. ""%8.6f"" a raiz, com ""%2i"" interaçoes\n", x_atual, k)
// Verificação para Newton-Raphson
printf("Verificacao: f(%.6f) = %.10f\n", x_atual, f(x_atual));
