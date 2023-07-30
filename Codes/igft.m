function f = igft(G,fhat,c)
%G = gsp_compute_fourier_basis(G);

[B,I] = maxk(abs(fhat),c);

v = zeros(1,length(fhat));
v(I) = fhat(I);
fhat = v;
f = gsp_igft(G,fhat);

end

