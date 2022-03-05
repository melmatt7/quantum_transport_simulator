structure='quantum_well'; %'quantum_well' or 'rtd'
model='bandstructure';

mat=material(structure);

t0=cputime;

varargin={mat};

[E V]=solve(model,varargin);

figure(1)
plot(mat.x,mat.V,mat.x,ones(length(mat.x),1)*E(1:5)'+V(:,1:5))


t1=cputime-t0