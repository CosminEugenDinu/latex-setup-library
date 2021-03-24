f = @(x) x.^3-4*x+2;
a = 0;
b = 1;
epsilon = 0.01;

function print_graph (f, a, b, iter_no)
    x_min=-2.5; step=0.05; x_max=2.5;
    x = x_min:step:x_max;
    hf = figure();
    g = @(x) 0;
    set(0,"defaultaxesfontsize",14);
    plot(x,f(x),'linewidth',5);
    hold on;
    axis([x_min,x_max,-3,8]);
    plot([x_min,x_max],[0,0],'k');
    plot([a,a],[0,f(a)],'linewidth',2);
    plot(a,f(a),'x-k','linewidth',5);
    plot([b,b],[0,f(b)],'linewidth', 2);
    plot(b,f(b),'x-k','linewidth', 5);
    legend(
    # graficul functiei f(x)
    'f(x)=x^3-4x+2',
    'location','northwest');
    hold off;
    title(strcat('Fig.3.',num2str(iter_no),' f(x)=x^3-4*x+2'));
    ylabel('f(x)');
    xlabel(strcat('a=',num2str(a),', f(a)=',num2str(f(a)),', b=',num2str(b),', f(b)=',num2str(f(b))));
    set(gca(),'xtick',[a,b]);
    set(gca(),'xaxislocation','origin');
    set(gca(),'ytick',[0]);
    set(hf,'visible','off');
    print(hf,strrep('Fig.3.{}.eps','{}',num2str(iter_no)),'-depsc');
    close();
endfunction

% print_graph (f, a, b, 0);

x_m = (a+b)/2;
i = 1;
max_i = 10;
while abs(f(x_m)) > epsilon 
    if max_i < i
        printf("Solution not found!\n");
        break;
    endif

    printf("i=%d & a=%f & b=%f & x_m=%f & f(x_m)=%f\n",i,a,b,x_m,f(x_m));
    % print_graph(f, a, b, i);
    x_m = (a+b)/2;
    if f(x_m)*a < 0
        b = x_m;
    else
        a = x_m;
    endif
    i++;
endwhile

% print_graph(f, a, b, i);
printf("i=%d & a=%f & b=%f & x_m=%f & f(x_m)=%f\n",i,a,b,x_m,f(x_m));