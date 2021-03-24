# Cod octave:
f = @(x) x.^3 - 4*x + 2;
x_0 = 0;
x_1 = 1;
x_2 = x_1 - (f(x_1)*(x_1-x_0))/(f(x_1)-f(x_0));
x_3 = x_2 - (f(x_2)*(x_2-x_1))/(f(x_2-f(x_1)));
printf("$x_2=%.3f, x_3=%.3f$\n", x_2, x_3);

function print_graph (f, x_0, x_1, iter_no)
    fx_0 = f(x_0);
    fx_1 = f(x_1);
    x_min=-2;step=0.05;x_max=2;
# Ecuatia secantei prin punctele (x_0, f(x_0)), (x_1, f(x_1))
    m = (fx_1 - fx_0) / (x_1 - x_0);
    y = @(x) m*(x-x_1) + fx_1;
# Ecuatia secantei cand y = 0 (intersectie Ox), x_2 este valoarea pentru care f(x_2)=0
    x_2 = x_1 - (fx_1*(x_1-x_0))/(fx_1-fx_0); 
    x = x_min:step:x_max;
    hf = figure();
    set(0,"defaultaxesfontsize",14);
    plot(x, f(x),'linewidth', 5);
    hold on;
    plot(x,y(x),'r','linewidth', 3);
    axis([x_min x_max -3, 6]);
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
    'f(x)=x^3 - 4*x + 2',
    # graficul liniei secante 
    'y = m*(x-x_1)+f(x_1), m=(f(x_1)-f(x_0))/(x_1-x_0)','','',
    # punctele de intersectie ale secante cu f(x)
    strcat('f(x_0)=',num2str(fx_0),', f(x_1)=',num2str(fx_1)),'',
    # punctul de intersectie al secantei cu axa Ox (pentru care y=0)
    strcat('y=0 => x=',num2str(x_2),', intersectia secantei cu Ox'),
    'location', 'northwest');
    hold off;
    title(strcat(
        strrep('Fig.5.{}','{}', num2str(iter_no)),
        strrep(' x_0 = {},','{}', num2str(x_0)),
        strrep(' x_1 = {},','{}', num2str(x_1)),
        strrep(' f(x_1) = {}','{}', num2str(fx_1))));
# Arata cateva puncte importante pe axa X (x_0, x_1)
    set(gca(), 'xtick', [x_0 x_1]);
    set(gca(), 'ytick', [0]);
    ylabel('f(x)');
    set(hf, "visible", "off");
    print(hf, strrep('Fig.5.{}.eps','{}',num2str(iter_no)), '-depsc');
    close();
endfunction

print_graph(f, x_0, x_1, 0);