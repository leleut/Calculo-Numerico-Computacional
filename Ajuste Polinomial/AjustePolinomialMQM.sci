//ajuste polinomial por minimos quadrados

clear(); clc();

caminho = get_absolute_file_path("AjustePolinomialMQM.sci");
exec(caminho + "plotar_ajuste_polinomial.sci", -1);

printf("\n Ajuste (polinomial) por minimos quadrados\n");
// ====================================================================
//ENTRADA DE DADOS
// ====================================================================

//exemplo
X = [1.3, 3.4, 5.1, 6.8, 8.0];
Y = [2.0, 5.2, 3.8, 6.1, 5.8];


// ====================================================================
//IMPRESSÃO DA TABELA DE DADOS
// ====================================================================
 printf("\n[1] TABELA DE DADOS UTILIZADA NO AJUSTE; \n\n");
 for i = 1:length(X)
     printf("   x(%d) = %10.6f     y(%d) = %10.6f\n", i, X(i), i, Y(i));
 end
// ====================================================================
 //FUNÇAO: AJUSTE POINOMIAL POR MINIMOS QUADRADOS
// ====================================================================
 
 function [pol_ajuste, SSR, R2] =AjustePolinomialMQM(X, Y, ordem)
     n = length(X);
     grau = ordem + 1;
     aux = 0;
     
     for i = 1:grau
         for j = 1:grau
             for k = 1:n
                 aux = aux + (X(k).^((i-1)+(j-1))); 
     end
     A(i,j) = aux;
     aux = 0;
 end
end
    format("v",9);
    printf("\n[2] MATRIZ DO SISTEMA NORMAL:\n");
    disp(A);
    
    
    aux = 0;
    for i = 1:grau
        for k = 1:n
            aux = aux + (X(k).^(i-1)) * Y(k);
        end
        B(i) = aux;
        aux = 0;
    end
    printf("\n[3] VETOR DOS TERMOS INDEPENDESTES:\n");
    disp(B);
    
    M = A \ B;
    printf("\n[4] COEFICIENTE DO POLINOMIO DE AJUSTE:\n");
    disp(M);
    
    
    pol_ajuste = poly(M, "x", "c");
    printf("\n[5] POLINOMIO AJUSTADO POR MQM:\n");
    disp(pol_ajuste);
    
    
    
    [SSR, R2] = calcular_desvios(X, Y, pol_ajuste);
 endfunction
// ====================================================================
 //FUNÇAO CALULO DOS DESVIOS DE DO COEFICIENTE R2
// ====================================================================
 function [SSR, R2] = calcular_desvios(X, Y, polinomio)
     n = length(X);
     Ybar = sum(Y) / n;
     SSR = 0;
     SST = 0;
     for i = 1:n
         ajuste = horner(polinomio, X(i));
         
         res_i = (Y(i) - ajuste)^2;
         SSR = SSR + res_i;
         
         sst_i = (Y(i) - Ybar)^2;
         SST = SST + sst_i;
     end
     R2 = 1 - SSR / SST;
     
     printf("\n[6] QUALIDADE DO AJUSTE:\n");
     //printf("    soma dos desvios quadraticos (SSR) = %.6f\n", SSR);
     printf("     coeficiente de determinaçao R^2   = %.6f\n", R2);
 endfunction
// ====================================================================
 //ESCOLHA DA ORDEM DO POLINOMIO
// ====================================================================



 ORDEM = 1;
 
 
 
// ====================================================================
 //EXECUÇAO DO AJUSTE
// ====================================================================
 [pol_ajuste, SSR, R2] = AjustePolinomialMQM(X, Y, ORDEM);
 
 plotar_ajuste_polinomial(X, Y, pol_ajuste);
 printf("\n FIM DO AJUSTE POLINOMIAL");
