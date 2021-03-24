# Cod octave:
f = @(x) 8*x.^3 + x.^2 + 8*x - 3;
x_0 = 0.0;
x_1 = 0.6;
epsilon = 0.01;

function print_graph (f, x_0, x_1, iter_no)
    fx_0 = f(x_0);
    fx_1 = f(x_1);
    x_min=-2; step=0.05; x_max=2;
# Ecuatia secantei prin punctele (x_0, f(x_0)), (x_1, f(x_1))
    m = (fx_1 - fx_0) / (x_1 - x_0);
    y = @(x) m*(x-x_1) + fx_1;
# Ecuatia secantei cand y = 0 (intersectie Ox), x_2 este valoarea pentru care f(x_2)=0
    x_2 = x_1 - (fx_1*(x_1-x_0))/(fx_1-fx_0); 

    x = x_min:step:x_max;
    hf = figure();
    set(0, "defaultaxesfontsize", 14);
    plot(x, f(x), 'linewidth', 5);
    hold on;
    plot(x, y(x), 'r', 'linewidth', 3);
    axis([x_min x_max -40, 60]);
# Printeaza linia verticala prin x_0 pana la graficul functiei
    plot([x_0 x_0], [-40 fx_0], '--', 'linewidth', 2);
# Printeaza linia verticala prin x_1 pana la graficul functiei
    plot([x_1 x_1], [-40 fx_1], '--', 'linewidth', 2);
# Print puncte de intersectie
    plot(x_0, fx_0, 'x-k', 'linewidth', 5); plot(x_1, fx_1, 'x-k', 'linewidth', 5);
# Print punctul de pe secanta la intersectia cu Ox (y=0)
    plot(x_2, 0, 'x-r', 'linewidth', 5);

    legend(
    # graficul functiei f(x)
    'f(x) = 8*x^3 + x^2 + 8*x - 3',
    # graficul liniei secante 
    'y = m*(x-x_1)+f(x_1), m=(f(x_1)-f(x_0))/(x_1-x_0)','','',
    # punctele de intersectie ale secante cu f(x)
    strcat('f(x_0)=',num2str(fx_0),', f(x_1)=',num2str(fx_1)),'',
    # punctul de intersectie al secantei cu axa Ox (pentru care y=0)
    strcat('y=0 => x=',num2str(x_2),', intersectia secantei cu Ox'),
    'location', 'northwest');
    hold off;
    title(strcat(
        strrep('Fig.2.{}','{}', num2str(iter_no)),
        strrep(' x_0 = {},','{}', num2str(x_0)),
        strrep(' x_1 = {},','{}', num2str(x_1)),
        strrep(' f(x_1) = {}','{}', num2str(fx_1))));
# Arata cateva puncte importante pe axa X (x_0, x_1)
    set(gca(), 'xtick', [x_0 x_1]);
    set(gca(), 'ytick', [0]);
    ylabel('f(x)');
    set(hf, "visible", "off");
    print(hf, strrep('Fig.2.{}.eps','{}',num2str(iter_no)), '-depsc');
    close();
endfunction

print_graph (f, x_0, x_1, 0)

i = 1;
i_max = 5;
while abs(f(x_0)) > epsilon && i < i_max 
    x_1 = x_1 - (f(x_1)*(x_1-x_0))/(f(x_1)-f(x_0));
    print_graph(f, x_0, x_1, i);
    printf("i=%d, x_0=%.2f, x_1=%f, f(x_1)=%f\n",i,x_0,x_1,f(x_1));
    i ++;
endwhile