n = 500;
%% PART 

[G,fn] = create_random_graph_signal(n);
param_plot.show_edges = 0;
figure;
gsp_plot_signal(G, fn, param_plot);
title("Spectral graph with sinusoid signal");
%% PART 2
[Gf,fhat] = gft(G,fn);

%% PART 3
errper = [];
for k = 1:n
    
fdash = igft(Gf,fhat,k);
%gsp_plot_signal(Gf,fdash,param_plot);

err = abs(fdash) - abs(fn);
err = abs(err);
err = err.*err;
nerr = sum(err);
%nerr = sqrt(nerr);

den = abs(fn);
den = den.*den;
fnor = sum(den);
%fnor = sqrt(fnor);

nerr = nerr/fnor;
errper = [errper, nerr];
end
pl = [25,50,100,200];
for i = 1:4
fdash = igft(Gf,fhat,pl(i));
    figure;
    gsp_plot_signal(Gf,fdash,param_plot);
    title("Reconstruction when C = "+pl(i));
    err = abs(fdash) - abs(fn);

end

figure;
p = plot(errper);
p.Color = "magenta";
xlabel("Number of coefficients taken");
ylabel("Relative error");
title("Average reconstruction error for signal compression");
