function []= pinOut (a)

global limitSwitch1; 
global limitSwitch2; 
global limitSwitch3; 
global pen_control; %Servo's control.
global motor1_positive; %clockwise
global motor1_negative; %contrary to clockwise
global motor1_speed; 
global motor2_positive; 
global motor2_negative; 
global motor2_speed;

limitSwitch1=22; 
limitSwitch2=24; 
limitSwitch3=26; 
pen_control=46;
motor1_positive=5; 
motor1_negative=6; 
motor1_speed=7; 
motor2_positive=8; 
motor2_negative=9; 
motor2_speed=10;

encoder0_pulseA=2;
encoder0_pulseB=3;
encoder1_pulseA=18;
encoder1_pulseB=19;

a.encoderAttach(0,encoder0_pulseA,encoder0_pulseB);
a.encoderAttach(1,encoder1_pulseA,encoder1_pulseB);

a.pinMode(limitSwitch1,'input');
a.pinMode(limitSwitch2,'input');
a.pinMode(limitSwitch3,'input');
a.pinMode(motor1_positive,'output');
a.pinMode(motor1_negative,'output');
a.pinMode(motor1_speed,'output');
a.pinMode(motor2_positive,'output');
a.pinMode(motor2_negative,'output');
a.pinMode(motor2_speed,'output');

a.digitalWrite(motor1_positive,0);
a.digitalWrite(motor1_negative,0);
a.analogWrite(motor1_speed,0);
a.digitalWrite(motor2_positive,0);
a.digitalWrite(motor2_negative,0);
a.analogWrite(motor2_speed,0);

end
