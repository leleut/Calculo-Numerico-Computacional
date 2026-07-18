clear();clc;clf()

printf("\n metod grafico para isolar f(x")
//x=-4:0.1:4
//y=x.^3-9*x+3

//-----------------ex3------------------

x= 10:0.01:13
y=(9.8 *75 ./ x).*(1-exp( -x * 8/75)) - 45



plot2d(x, y)
h = gce()//obter o manipulador grafico
line_handle = h.children //maniopuadr de linha
line_handle.thickness = 4 //espessura da linha
line_handle.line_mode = 1
line_handle.foreground = color('blue')

xtitle("localização das raizes: grafico de V(ca)=(9.8 *75 ./ x).*(1-exp( -x * 8/75)) - 45",...
"valores do dominio [10 ,13]",...
"valor da funçao V(ca)=y")

a=gca()
a.title.font_size = 4
a.x_label.font_size = 4
a.y_label.font_size = 4

xgrid()
