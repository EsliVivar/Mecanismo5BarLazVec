%Mecanismo de 5 Barras lazo vectorial

clc;
clear all;
hold on;
axis equal;
grid on

xlim([-10 10]);
ylim([-10 15]);
title('MECANISMO DE 5 BARRAS LAZO VECTORIAL ');

a=5;
b=7;
c=8;
d=4;
f=6;

%lamb= %Relacion de engranes
lamb=-1; %diam2/diam3
phi=pi/3; %angulo de fase

theta2=0;
k=1;

while theta2<=2*pi
    cla;

   theta5=lamb*theta2+phi;
    
    %ANGULO THETA4
    A=2*c*(d*cos(lamb*theta2+phi)-a*cos(theta2)+f);
    B=2*c*(d*sin(lamb*theta2+phi)-a*sin(theta2));
    C=a^2-b^2+c^2+d^2+f^2-2*a*f*cos(theta2)-2*d*(a*cos(theta2)-f)*cos(lamb*theta2+phi)-2*a*d*sin(theta2)*sin(lamb*theta2+phi);
    D=C-A;
    E=2*B;
    F=A+C;
    theta4=2*atan((-E-sqrt(E^2-4*D*F))/(2*D));
    
    %ANGULO THETA3
    G=2*b*(a*cos(theta2)-d*cos(lamb*theta2+phi)-f);
    H=2*b*(a*sin(theta2)-d*sin(lamb*theta2+phi));
    K=a^2+b^2-c^2+d^2+f^2-2*a*f*cos(theta2)-2*d*(a*cos(theta2)-f)*cos(lamb*theta2+phi)-2*a*d*sin(theta2)*sin(lamb*theta2+phi);
    L=K-G;
    M=2*H;
    N=G+K;
    
    theta3=(2*atan((-M+sqrt(M^2-4*L*N))/(2*L)));
    
    %Vectores
    Ax=(a*cos(theta2));
    Ay=(a*sin(theta2));
    
    Bx=(b*cos(theta3)+Ax);
    By=(b*sin(theta3)+Ay);
    
    Cx=(d*cos(theta5)+f);
    Cy=(d*sin(theta5));
    
    x1=[0 Ax];
    y1=[0 Ay];
    
    x2=[Ax Bx];
    y2=[Ay By];
    
    x3=[Bx Cx];
    y3=[By Cy];
    
    x4=[f Cx];
    y4=[0 Cy];

    plot(x1,y1,'-o')
    plot(x2,y2,'-o')
    plot(x3,y3,'-o')
    plot(x4,y4,'-o')
    theta2=theta2+pi/200;
    
    k=k+1;
    drawnow;
    
end