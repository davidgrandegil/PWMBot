    function [p] = calculatePosition(radio,number_of_sides)
%%This function has two arguments. 
%1) Radio of a polygon
%2) Number of sides of a polygon
%The output is a matrix that contains X-Y positions of the polygon.


tita =[-pi/2:(2*pi/number_of_sides):(2*pi-(pi/2))]; 

positions=[radio*cos(tita);(radio*sin(tita))+radio+7.9]';
position_matrix=(vertcat([0 0],positions));
for j=1:3
    for i=0:((2^(j-1))*number_of_sides)
        if(j==1)
            if(i==0)
            p(1,1)=position_matrix(1,1);
            p(1,2)=position_matrix(1,2);
            p(2,1)=position_matrix(1,1)+((position_matrix(2,1)-position_matrix(1,1))/2);
            p(2,2)=position_matrix(1,2)+((position_matrix(2,2)-position_matrix(1,2))/2);
            p(3,1)=position_matrix(2,1);
            p(3,2)=position_matrix(2,2);
            else
            p(2*(i+1),1)=position_matrix(i+1,1)+((position_matrix(i+2,1)-position_matrix(i+1,1))/2);
            p(2*(i+1),2)=position_matrix(i+1,2)+((position_matrix(i+2,2)-position_matrix(i+1,2))/2);
            p(2*(i+1)+1,1)=position_matrix(i+2,1);
            p(2*(i+1)+1,2)=position_matrix(i+2,2);
            end
        else
            if(i==0)
                a=0;
            else 
            p(2*(i+1),1)=position_matrix(i+2,1)+((position_matrix(i+3,1)-position_matrix(i+2,1))/2);
            p(2*(i+1),2)=position_matrix(i+2,2)+((position_matrix(i+3,2)-position_matrix(i+2,2))/2);
            p(2*(i+1)+1,1)=position_matrix(i+3,1);
            p(2*(i+1)+1,2)=position_matrix(i+3,2);
            end
        end
    end
    position_matrix=p;
end


    
%Plot the polygon choosen

tita =[-pi/2:(2*pi/number_of_sides):(2*pi-(pi/2))]; 
pos_x = radio*cos(tita);
pos_y = ((radio*sin(tita))+2*radio);

plot(pos_x,pos_y,'-x')
axis equal
axis([-15 15 2 23])