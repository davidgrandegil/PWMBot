function [P1,P2,P3]=calculateReferences(angle_matrix)

tam=length(angle_matrix);
vmax=25;
for i=1:(tam-1)
    aux1=angle_matrix(i+1,1)-angle_matrix(i,1);
    aux2=angle_matrix(i+1,2)-angle_matrix(i,2);
    if(abs(aux2)<abs(aux1))
        t(i,1)=abs((aux1/vmax)*60);
    end
    if(abs(aux2)>=abs(aux1))
        t(i,1)=abs((aux2/vmax)*60);
    end
    P12(i,1)=angle_matrix(i,1);
    P22(i,1)=angle_matrix(i,2);
end
for i=1:(tam-1)
    if i==1
        tt(i,1)=t(i,1);
    else
        tt(i,1)=t(i,1)+tt(i-1,1);
    end
end

P1=horzcat(tt,P12);
P2=horzcat(tt,P22);
P1=vertcat([0,0],P1);
P2=vertcat([0,0],P2);

P2(2,2)=0
P1(2,2)=0

for i=1:tam
P3(i,1)=P2(i,1);
P3(i,2)=1;
end
P3(1,2)=0;
P3(2,2)=0;
P3(3,2)=0;
P3(tam-1,2)=0;
P3(tam,2)=0;
end
