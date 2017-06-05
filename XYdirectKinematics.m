function [x,y]=XYdirectKinematics(n1,n2)
L=33.5005;
RR=9;
RP=0.6;
x=2*pi*RP*n2*sin(atan((2*pi*RR*n1)/L));
y=2*pi*RP*n2*cos(atan((2*pi*RR*n1)/L));
end
