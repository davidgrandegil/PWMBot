function [P1,P2,P3,aux]= main(arduinoPort,radio,number_of_sides)
delete(instrfind({'Port'},{arduinoPort'}))
a=arduino(arduinoPort);
C=calculatePosition(radio,number_of_sides);
I=inverseKinematics(C);
[P1,P2,P3]=calculateReferences(I);
pinOut(a);
zeroSearch(a);
encoderReset(a,0);
encoderReset(a,1);
end
