structure='double_quantum_well'
model='bandstructure';

mat=material(structure);

t0=cputime;

varargin={mat};

[E V]=solve(model,varargin);

E

figure(1)
plot(mat.x,mat.V,mat.x,ones(length(mat.x),1)*E(1:5)'+V(:,1:5))
figure(2)
plot(mat.x,mat.V,mat.x,ones(length(mat.x),1)*E(1:5)')


t1=cputime-t0