function MG=calc_discrete_hamiltonian(Nx,mat,V_pot)

hbar=1.0546e-34;
e=1.6022e-19;
mo=9.1095e-31;

T0=hbar.^2/(mo*e*1e-18);

m=mat.m;
x=mat.x;

MG=sparse(Nx,Nx);

for I=2:Nx-1,
    
    dxp=x(I+1)-x(I);
    dxm=x(I)-x(I-1);
    
    MG(I,I-1)=%to be filled
    MG(I,I+1)=%to be filled
    MG(I,I)=%to be filled
    
end

dx=x(2)-x(1);
MG(1,1)=%to be filled
MG(1,2)=%to be filled

dx=x(Nx)-x(Nx-1);
MG(Nx,Nx)=%to be filled
MG(Nx,Nx-1)=%to be filled