//plotar ajuste polinomial(REGRESSAO POLINOMIAL)
function plotar_ajuste_polinomial(X, Y, pol_ajuste)
    dx = (max(X)- min(X))*0.05;
    xx = linspace(min(X)-dx, max(X)+dx, 300);
    yy = horner(pol_ajuste, xx);
    
scf(0);
clf();
    plot2d(xx, yy, style = [color("blue")]);
    h = gce();
    h.children.thickness = 4;
    plot2d(X,Y,-4);
    
    xtitle("curva de ajuste polinomial - MQM", ...
           "dados observados, X(i)", ...
           "valores resultantes, Y(i)");
    legend(["curvas ajustadas", "dados observados"], 2);
    xgrid();
    
    
    
   ax = gca();
   ax.font_size = 4;
   ax.x_label.font_size = 4;
   ax.y_label.font_size = 4;
   ax.title.font_size = 4;
   
   lg = findobj("type", "Legend");
   if ~isempty(lg) then
       lg.font_size = 3;
   end
           
    
endfunction
