function [E_res,dE_res]=calc_energy_res(M,SigRS,Emin,Emax)

M=M+diag(SigRS);

N_eigs=50;

max_imag=3e-3;

opts.disp=0;
[V_help E_help]=eigs(M,N_eigs,'sm',opts);

I_ord=find(real(E_help)>(Emin)&real(E_help)<Emax);

E_help=E_help(I_ord);

N=length(E_help);

I_res=0;

for I=3:N-2,
    if ((abs(imag(E_help(I)))<abs(imag(E_help(I-1))))&(abs(imag(E_help(I)))<abs(imag(E_help(I+1)))))&...
            ((abs(imag(E_help(I)))<abs(imag(E_help(I-2))))&(abs(imag(E_help(I)))<abs(imag(E_help(I+2)))))&...
            (abs(imag(E_help(I)))<max_imag),
        I_res=I_res+1;
        E_res(I_res)=real(E_help(I));
        dE_res(I_res)=abs(imag(E_help(I)));
    end
end

if I_res==0,
    if ((abs(imag(E_help(2)))<abs(imag(E_help(1))))&(abs(imag(E_help(2)))<abs(imag(E_help(3)))))&...
            (abs(imag(E_help(2)))<max_imag),
        E_res=real(E_help(2));
        dE_res=abs(imag(E_help(2)));
    else
        E_res=[];
        dE_res=[];
    end
end
