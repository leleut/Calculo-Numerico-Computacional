//met de euler - 1a ordem
//met  de euler de 1a ordem para PVI: y' = f(x,y) = f(x,y), y(x0) =y0

function [x,y] =  euler_1a_ordem(f,x0,y0,h,n)
    /*
    if h <= 0 then  then
        error("o passo h de ser positivo.");
    end 
    if n < 0 then
        error("o numero de subintervaos n deve ser maior ou igual a 1.");
    end
    */
    //============================================
    x= zeros(1,n+1);
    y= zeros (1,n+1);
    x(1) = x0;
    y(1) = y0;
    for i = 1:n
        x(i + 1) = x(i) + h;
        y(i + 1) = y(i) + h * f(x(i), y(i)); // euler explicito
    end
endfunction
