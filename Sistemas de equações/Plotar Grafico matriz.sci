clear(); clc(); clf();

//define o intervalo para os x
x1 = linspace(-5,5,200);
x2 = linspace(-5,5,200);

//...............................................
//calcula y para cada equação
//y1 = -x1 //equação x + y = 0
//y2 = 1-x2 //equação x + 1
//...............................................
//y1 = -x1; //x+y = 0
//y2 = +x2; //2x+2y = 0
//...............................................
y1 = -x1; //x +y = 0
y2 = -x2; //2x + 2y =0
///.............................................
//plata as linhas para as equações
plot(x1,y1, 'b');   //reta azul para primeira equação
h1 = gce();         //obter manipulador do objeto grafico
h1.children.thickness = 3 //ajustar espessura da linha
plot(x2,y2,'r--');  //reta vermelha para a 2 equação
h2= gce();          //obter o manipulador do objeto graf.
h2.children.thickness = 3 //ajustar espessura da linha

//....................................................
//adicionar rotulos, legenda e grade
xlabel('Eixo x');
ylabel('Eixo y');
legend(['x + y = 0', '2x + 2y = 0']);
xtitle('Graficos de x + y = 0 e 2x + 2y = 0');
a = gca();
a.title.font_size = 4;
a.x_label.font_size = 4;
a.y_label.font_size = 4;
xgrid();
