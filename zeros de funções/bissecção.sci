
clear(); clc();
printf("\n **** APROXIMAÇÃO PELO METODO DA BISSECÇÃO ****\n")

//------------------------ex 3---------------------------------

deff('y = f(x)', 'y =(9.8 *75 / x)*(1-exp( -x * 8/75)) - 45')
ak = 10
bk = 13
epsilon1 = 1e-06
epsilon2 = 1e-06


k = 0
nmax = 100
xm = 0.5*(ak + bk)

printf("k  |      xm      | abs(bk-ak) |    f(xm)    \n")
while (k < nmax) & (abs(bk - ak) > epsilon1) & (abs(f(xm)) > epsilon2)
    xm = 0.5*(ak + bk)   
    k = k + 1
    printf("%2.2i | %10.6f | %10.6f | %10.6f |\n", k, xm, abs(bk-ak), f(xm)) 
    if f(ak) * f(xm) < 0 then
        bk = xm
    else
        ak = xm
    end
end
printf("Aprox. ""%8.6f"" à raiz, com ""%2.2i"" iterações\n", xm, k)

printf("Verificacao: f(%.6f) = %.10f\n", xm, f(xm));//verificaçao da raiz
