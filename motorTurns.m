function []=motorTurns(a,motor,vel)
global motor1_positive; %clockwise
global motor1_negative; %contrary to clockwise
global motor1_speed; 
global motor2_positive; 
global motor2_negative; 
global motor2_speed;
switch (motor)
    case 1
        m1=motor1_positive;
        m2=motor1_negative;
        mspeed=motor1_speed;
        
    case 2
        m1=motor2_positive;
        m2=motor2_negative;
        mspeed=motor2_speed;
end
if(vel>0)
    a.digitalWrite(m1,1);
    a.digitalWrite(m2,0);
    a.analogWrite(mspeed,vel);
end
if(vel<0)
    a.digitalWrite(m1,0);
    a.digitalWrite(m2,1);
    a.analogWrite(mspeed,abs(vel));
end
if(vel==0)
    a.digitalWrite(m1,0);
    a.digitalWrite(m2,0);
    a.analogWrite(mspeed,0);
end
end
