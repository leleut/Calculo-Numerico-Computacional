//met euler modificado
//1) função implementa o met de euler modificado

function [x,y] = euler_modificado(f,x0,y0,h,n)
    
    if h <= 0 then
        error("o passo h de ser positivo.");
    end 
    if n < 0 then
        error("o numero de subintervaos n deve ser maior ou igual a 1.");
    end
    
    x= zeros (1,n+1);
    y= zeros (1,n+1);
    x(1) = x0;
    y(1) = y0;
    for i = 1:n
        x(i + 1) = x(i) + h;
        k1 = h * f(x(i), y(i));
        k2= h * f(x(i + 1), y(i)+ k1);
        y(i + 1) = y(i) + 0.5 * (k1 + k2); // euler explicito
    end 
endfunction
