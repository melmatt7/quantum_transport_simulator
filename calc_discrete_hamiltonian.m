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
    dxpm = dxm+dxp;
    mdiff = (m(I)-m(I-1));
    
    MG(I,I-1)=hbar.^2*mdiff/(2*mo*m(I)*m(I-1)*dxpm*dxm) + 1/(m(I)*dxpm*dxm);
    MG(I,I+1)=-hbar.^2*mdiff/(2*mo*m(I)*m(I-1)*dxpm*dxm) + 1/(m(I)*dxpm*dxp);
    MG(I,I)=hbar.^2/(mo*m(I)*(dxpm));
    
end

dx=x(2)-x(1);
mdiff1 = m(2)-m(1);
MG(1,1)=hbar.^2*mdiff1/(2*mo*m(1)*m(2)*dx^2);
MG(1,2)=-hbar.^2*mdiff1/(2*mo*m(1)*m(2)*dx^2);

dx=x(Nx)-x(Nx-1);
mdiffN = m(Nx)-m(Nx-1);
MG(Nx,Nx)=-hbar.^2*mdiffN/(2*mo*m(Nx)*m(Nx-1)*dx^2);
MG(Nx,Nx-1)=hbar.^2*mdiffN/(2*mo*m(Nx)*m(Nx-1)*dx^2);

