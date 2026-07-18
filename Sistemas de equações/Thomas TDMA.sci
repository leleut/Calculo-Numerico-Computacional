// MET. DIRETO DE THOMAS - TDMA
clear(); clc();

printf("\n********** Método de Thomas - TDMA **********\n");
//printf(" Resolução de sistemas de equações tridiagonais\n");

// dados de entrada - Vetores dos coeficientes e vetor dos termos independentes

/*
a = [0; -1; -1];                // diagonal suprema
b = [2; 2; 2];                  // diagonal principal
c = [-1; -1; 0];                // diagonal inf
d = [1; 1; 1];                  // termos independenes
*/


A = [2,-1,0,0,0;
    -1,2,-1,0,0;
    0,-1,2,-1,0;
    0,0,-1,2,-1;
    0,0,0,-1,2]
B = [100;0;0;0;200]

a = [0; -1; -1; -1; -1];          // diagonal inferior (começa com 0)
b = [2; 2; 2; 2; 2];              // diagonal principal
c = [-1; -1; -1; -1; 0];          // diagonal superior (termina com 0)
d = [100; 0; 0; 0; 200];          // termos independentes (Vetor B)


// cópia dos dados originais para verificacao posterior
ta = a; tb = b; tc = c; td = d;
//.............................................................................
printf(" *** Entrada - Vetores colunas a, b, c e d *** \n");

printf(" Vetor a:\n");
for i = 1:length(a)
    mprintf("%10.6f\n", a(i));
end

printf(" Vetor b:\n");
for i = 1:length(b)
    mprintf("%10.6f\n", b(i));
end

printf(" Vetor c:\n");
for i = 1:length(c)
    mprintf("%10.6f\n", c(i));
end

printf(" Vetor d:\n");
for i = 1:length(c)
    mprintf("%10.6f\n", d(i));
end

//.............................................................................
printf("************ TRIANGULARIZAÇÃO *************:\n");
// alg. de Thomas
n = length(b);
if b(1) == 0 then
    error("ERRO: pivô nulo na primeira etapa do método de Thomas.");
end

c(1) = c(1) / b(1);
d(1) = d(1) / b(1);
for i = 2:n-1
    temp = b(i) - a(i) * c(i-1);
    if temp == 0 then
        error("ERRO: pivô nulo durante a triangularização do método de Thomas.");
    end
    c(i) = c(i) / temp;
    d(i) = (d(i) - a(i) * d(i-1)) / temp;
end
temp = b(n) - a(n) * c(n-1);
if temp == 0 then
    error("ERRO: pivô nulo na última etapa da triangularização do método de Thomas.");
end
d(n) = (d(n) - a(n) * d(n-1)) / temp;

printf(" Saída - Vetor c modificado:\n");
for i = 1:n
    mprintf("%10.6f\n", c(i));
end

printf(" Saída - Vetor d modificado\n");
for i = 1:n
    mprintf("%10.6f\n", d(i));
end

//.............................................................................
printf("*************** RETROSUBSTITUIÇÃO ***************:\n");
// alg. de retrosubstituicao
X =  zeros(n,1);
X(n) = d(n);
for i = (n-1:-1:1)
    X(i) = d(i) - c(i) * X(i + 1);
end

//.............................................................................
// dados de saída - soluçao X do sistema tridiagonal
printf(" Solução X do sistema:\n");
mprintf("  %.6f\n", X);

//.............................................................................
printf("******** Verificação da solução, se TX = d ********:\n");
// verificação dos resultados mostrando que TX = d original
for i = 1:n
    s = 0;
    if i > 1 then
        s = s + ta(i) * X(i-1);
        printf("(%.3f*%.3f) + ", ta(i), X(i-1));
    end
    s = s + tb(i) * X(i);
    if i < n then
         printf("(%.3f*%.3f) + ", tb(i), X(i));
         s = s + tc(i) * X(i + 1);
         printf("(%.3f*%.3f) = ", tc(i), X(i + 1));
    else 
         printf("(%.3f*%.3f) = ", tb(i), X(i));
    end
    printf("%.3f\n", s);
end

//.............................................................................
printf("************ FIM DO TDMA ************\n");
//.............................................................................



