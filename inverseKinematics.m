function [n] = inverseKinematics(position_matrix)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
global L RR RP 
size=length(position_matrix);
%units in cm
L=33.005;
RR=1.8;
RP=0.6;
x0=2.6;
y0=7.9;
for i=4:(size)
    
% posx(i,1)=position_matrix(i,1);
% posy(i,2)=position_matrix(i,2);
x=position_matrix(i,1);
y=position_matrix(i,2);

aux=(sqrt(abs((x^2)+(y^2))))
aux2=x0/(aux+0.01)
alfa=asin(aux2)
beta=atan(x/y)
q1=beta-alfa
q2=(sqrt((x^2)+(y^2)))*cos(alfa)-y0

n(i,1)=(L*tan(q1))/(2*pi*RR)
n(i,2)=q2/(2*pi*RP)

% 
% n(i,1)=(L*x)/(y*2*pi*RR);
% alfa=((2*pi*RR*((L*x)/(y*2*pi*RR)))/L);
% n(i,2)=y/(2*pi*RP*cos(atan(alfa)));


% xx(i,1)=[(L*(position_matrix(i,1)/((position_matrix(i,2))*2*pi*RR)))];
% yy(i,1)=[position_matrix(i,2)/(2*pi*RP*cos(atan((2*pi*RR*xx(i,1)))/L))];

% angle_matrix=horzcat(n1,n2);
end
% angle_matrix(1,1)=0;
% angle_matrix(1,2)=0;
end