x = 0:0.01:3;
hf = figure ();
set (0,'defaultaxesfontsize', 14)
plot (x, erf (x), 'linewidth', 5);
hold on;
plot (x, x, 'r', 'linewidth', 3);
axis ([0, 3, 0, 1]);
xlabel ("x");
ylabel ("erf (x)");
title ("erf (x) with text annotation");
# Show some custom points on X axis 
set(gca(), 'xtick', [0.5 1 2]);
text (0.65, 0.6175, strcat ('\leftarrow x = {2/\surd\pi',
' {\fontsize{16}\int_{\fontsize{8}0}^{\fontsize{8}x}}',
' e^{-t^2} dt} = 0.6175'));
set (hf, "visible", "off")
print(hf, 'fig.eps', '-depsc');