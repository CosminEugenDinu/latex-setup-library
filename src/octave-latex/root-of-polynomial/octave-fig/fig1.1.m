# Cod octave:
f = @(x) x.^3-x.^2-x+1;
df = @(x) 3*x.^2-2*x-1;
epsilon = 0.01;
x_0 = -0.2;
x_1 = x_0 - (f(x_0) / df (x_0));

function print_graph (f, df, x_0, x_1, iter_no)
# Ecuatia tangentei la f(x_0)
    y = @(x) df(x_0)*(x-x_0)+f(x_0);
# Cod octave grafic
    x_min=-0.5; step=0.05; x_max=2.5;
    x = x_min:step:x_max;
    hf = figure();
    set(0, "defaultaxesfontsize", 14);
    plot(x, f(x), 'linewidth', 5);
    hold on;
    plot(x, y(x), 'r', 'linewidth', 3);
    axis([x_min x_max 0 4]);
    hold on;
# Printeaza linia verticala prin x = -0.2 (x_0) pana la graficul functiei
    fx_0 = f(x_0);
    plot([x_0 x_0], [0 fx_0], '--', 'linewidth', 2);
    hold on;
    title(strcat(
        strrep('Fig.1.{}','{}', num2str(iter_no)),
        strrep(' x_0 = {},','{}', num2str(x_0)),
        strrep(' x_1 = {}','{}', num2str(x_1))));
# Arata cateva puncte importante pe axa X (x_0, x_1)
    set(gca(), 'xtick', [x_0 x_1]);
# Arata f(x_0) pe axa Y
    set(gca(), 'ytick', [fx_0])
    ylabel('f(x) = x^3-x^2-x+1');
    text(x_0, fx_0, strcat('  <- (x_0=',num2str(x_0),', f(x_0)=',num2str(fx_0),')'));
    set(hf, "visible", "off");
    print(hf, strrep('Fig.1.{}.eps','{}',num2str(iter_no)), '-depsc');
endfunction


iter_count = 1;
max_iter = 10;
while epsilon < abs(f(x_1))
    if iter_count > max_iter 
    break;
    endif
# Urmatoarea estimare a solutiei
    x_1 = x_0 - (f(x_0) / df (x_0));
    print_graph(f, df, x_0, x_1, iter_count);
    x_0 = x_1;
    iter_count ++;
endwhile
printf("%f, ", x_1);
print_graph(f, df, x_0, x_1, iter_count);