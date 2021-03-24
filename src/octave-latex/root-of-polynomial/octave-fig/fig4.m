f = @(x) x.^3 - 4*x + 2;
df = @(x) 3*x^2 - 4;
x_1 = 1;
x_2 = x_1 - f(x_1)/df(x_1);

function print_graph (f, df, x_1, x_2, iter_no)
# Ecuatia tangentei la f(x_1)
    y = @(x) df(x_1)*(x-x_1)+f(x_1);
# Cod octave grafic
    x_min=-1;step=0.05;x_max=2;
    x = x_min:step:x_max;
    hf = figure();
    set(0,"defaultaxesfontsize", 14);
    plot(x,f(x),'linewidth',5);
    hold on;
    plot(x, y(x),'r','linewidth',3);
    axis([x_min,x_max,-2,3]);
# Printeaza linia verticala prin x = -0.2 (x_1) pana la graficul functiei
    fx_1 = f(x_1);
    plot([x_1,x_1],[0,fx_1],'linewidth',2);
    hold off;
    title(strcat(
        strrep('Fig.4.{}','{}', num2str(iter_no)),
        strrep(' x_1 = {},','{}', num2str(x_1)),
        strrep(' x_2 = {}','{}', num2str(x_2))));
    legend(
        'f(x)=x^3-4x+2',
        "y=f\'(x_1)*(x-x_1)+f(x_1)",
        'location', 'northwest');
    set(gca(), 'xtick', [x_1,x_2]);
    set(gca(), 'xaxislocation', 'origin');
    set(gca(), 'ytick', [fx_1])
    ylabel('f(x)');
    text(x_1, fx_1, strcat('  <- (x_1=',num2str(x_1),', f(x_1)=',num2str(fx_1),')'));
    set(hf, "visible", "off");
    print(hf, strrep('Fig.4.{}.eps','{}',num2str(iter_no)), '-depsc');
endfunction

print_graph (f, df, x_1, x_2, 0);