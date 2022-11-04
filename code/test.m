% Input OBJ file
file = "../data/bunny.obj";
% Noise strength
noise = 0.03;
% Size of the neighborhood
k=2;
% Degree of polynomial to be fitted
d=1;
% Number of iterations
N=1;

% Resolution of output images
res = '-r300';

[V0,T]=read_mesh(file);
V=add_noise(V0,noise);
W=sgfilter(V,T,k,d);

inputfname=split(file,'/');
meshfname=split(inputfname{length(inputfname)},'.');
meshname=meshfname{1};

draw_mesh(V0,T);
print(sprintf('../results/%s_original',meshname), '-dpng', res);

draw_mesh(V,T);
print(sprintf('../results/%s_noisy',meshname), '-dpng', res);

draw_mesh(W,T);
print(sprintf('../results/%s_SG(%d,%d)x%d',meshname,k,d,N), '-dpng', res);