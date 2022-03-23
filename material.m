function mat=material(structure)

%Units
%distance: nm
%potential: eV

switch structure,
    
    case 'quantum_well',
        
        dx=0.1;

        Lbarrier_left=20;
        Lqw=5;
        Lbarrier_right=20;

        mbarrier=0.1;
        mqw=0.065;

        Vbarrier=30;
        Vqw=0;

        L=[Lbarrier_left Lqw Lbarrier_right];
        m=[mbarrier mqw mbarrier];
        V=[Vbarrier Vqw Vbarrier];
        
    case 'double_quantum_well',
        
        dx = 0.1;
        
        Lside_left=20;
        Lqw=5;
        mid=4;
        Rqw=6
        Lside_right=20;
        
        mbarrier=0.1;
        mqw=0.065;
        
        Vbarrier=0.3;
        Vqw=0;
        
        L=[Lside_left Lqw mid Rqw Lside_right];
        m=[mbarrier mqw mbarrier mqw mbarrier];
        V=[Vbarrier Vqw Vbarrier Vqw Vbarrier];
        
    case 'rtd',
        
        dx=0.1;
        
        Lside_left=20;
        Lbarrier_left=3;
        Lqw=5;
        Lbarrier_right=3;
        Lside_right=20;
        
        mside=0.065;
        mbarrier=0.1;
        mqw=0.065;
        
        Vside=0;
        Vbarrier=0.3;
        Vqw=0;
        
        L=[Lside_left Lbarrier_left Lqw Lbarrier_right Lside_right];
        m=[mside mbarrier mqw mbarrier mside];
        V=[Vside Vbarrier Vqw Vbarrier Vside];
        
end

%dx (discretization length), L (segment length), m (segment effective mass), and V (segment potential), must absolutely be defined%
%No need to change the rest if you want a new structure%

xmin=0;
xmax=sum(L);

Nx=round((xmax-xmin)/dx)+1;

mat.Nx=Nx;
mat.x=zeros(1,Nx);
mat.V=zeros(1,Nx);
mat.n=zeros(1,Nx);

mat.x(1)=xmin;
mat.m(1)=m(1);
mat.V(1)=V(1);

index=2;
Ltot=L(1);

for I=1:length(L),
    
    while (mat.x(index-1)+dx)<=(Ltot+dx/10),
        
        mat.x(index)=mat.x(index-1)+dx;
        mat.m(index)=m(I);
        mat.V(index)=V(I);
        index=index+1;
        
    end
    
    if I<length(L),
        Ltot=Ltot+L(I+1);
    end
    
end