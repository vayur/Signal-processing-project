function [Gf,fhat] = gft(G,fn)

Gf = gsp_compute_fourier_basis(G);

fhat = gsp_gft(Gf,fn);

end

