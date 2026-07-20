//met_rk3_3a_ordem.sce - methodo de Runge-Kutta de 3a ordem. PVT y'=f(x,y) y(0)=y0


function[x,y]= rk3_3a_ordem(f,x0,y0,h,n)
  x = zeros(1,n+1);
    y = zeros(1,n+1);
    x(1) = x0;
    y(1) = y0;  
    for i = 1:n
        xi = x(i);
        yi = y(i);
        k1 = h *  f(xi,yi);
        k2 = h *  f(xi + h*0.5, yi + k1*0.5);
        k3 = h *  f(xi + h*0.75, yi + 0.75*k2);
        y(i+1) = yi + (2/9)*k1 + (1/3)*k2 + (4/9)*k3;
        x(i+1) = xi + h;
    end
  endfunction
