function []=zeroSearch(a)
global limitSwitch1; 
global limitSwitch2; 
global limitSwitch3;
global servo_control;

pinOut(a);
servoAttach(a,46);
servoWrite(a,46,80);

motorTurns(a,1,0);
motorTurns(a,1,0);
zero1=0;
zero2=0;
zero3=0;

while(zero1~=1)
    zero1=digitalRead(a,limitSwitch1);
    zero2=digitalRead(a,limitSwitch2);
    motorTurns(a,1,255)
    if(zero2==1)  
        motorTurns(a,1,0)
        break;
    end
end
pause(0.1)
zero1=0;
while(zero1~=1)
    zero1=digitalRead(a,limitSwitch1);
    motorTurns(a,1,-255)
end

motorTurns(a,1,0)
a.encoderReset(0);

zero3=0;
while(zero3~=1)
    zero3=digitalRead(a,limitSwitch3);
    motorTurns(a,2,-200)
end
motorTurns(a,2,0)
a.encoderReset(1);
servoWrite(a,46,62);



    



