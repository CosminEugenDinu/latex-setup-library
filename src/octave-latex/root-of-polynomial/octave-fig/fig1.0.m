# Cod octave:
f = @(x) x.^3-x.^2-x+1;
x_min=-1; step=0.05; x_max=2;
x = x_min:step:x_max;
hf = figure();
set(0, "defaultaxesfontsize", 14);
plot(x, f(x), 'linewidth', 5);
axis([-1 x_max 0 2]);
hold on;
title('Fig.1.0 f(x) = x^3-x^2-x+1');
ylabel('f(x)');
set(hf, "visible", "off");
print(hf, 'Fig.1.0.eps', '-depsc');