function [E V]=solve_bandstructure(varargin)

mat=varargin{1}{1}{1};

M=calc_discrete_hamiltonian(mat.Nx,mat,mat.V);

[V D]=eig(full(M));

E=diag(D);

[E ind]=sort(E);
V=V(:,ind);

for I=1:length(ind),
    V(:,I)=sign(V(1,I))*V(:,I);
end