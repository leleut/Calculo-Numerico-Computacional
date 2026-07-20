//met_rk4_4a_ordem.sce - methodo de Runge-Kutta de 4a ordem. PVT y'=f(x,y) y(0)=y0


function[x,y]= rk4_4a_ordem(f,x0,y0,h,n)
  x = zeros(1,n+1);
    y = zeros(1,n+1);
    x(1) = x0;
    y(1) = y0;  
    for i = 1:n
        xi = x(i);
        yi = y(i);
        k1 = h *  f(xi,yi);
        k2 = h *  f(xi + h*0.5, yi + k1*0.5);
        k3 = h * f(xi + h*0.5,  yi + k2*0.5);
        k4 = h *  f(xi + h, yi + k3);
        y(i+1) = yi + (1/6)*(k1 + 2*k2 + 2*k3 + k4);
        x(i+1) = x(i) + h;
    end
  endfunction
