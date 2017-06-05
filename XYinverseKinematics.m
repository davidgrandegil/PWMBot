function [n1,n2]=XYinverseKinematics(x,y)
L=33.5005;
RR=1.8;
RP=0.6;
n1=(L*x)/(y*2*pi*RR);
n2=y/(2*pi*RP*cos(atan((2*pi*RR*((L*x)/(y*2*pi*RR)))/L)));
end
