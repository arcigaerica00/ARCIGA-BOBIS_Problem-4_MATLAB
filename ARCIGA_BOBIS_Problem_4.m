disp('Trajectory of a Projectile')
H= input('Enter the initial height of the projectile above the ground in meters: ');
V= input('Enter the magnitude of the velocity in m/s: ');
th= input('Enter the angle in degrees with respect to the positive x-axis at which the projectile is fired: ');
Ax= input('Enter the x-component of the acceleration in m/s^2(include the sign): ');
Ay= input('Enter the y-component of the acceleration in m/s^2(include the sign): ');
%Solve for the components of velocity in x-axis and y-axis
Vx=(V*cosd(th));
Vy=(V*sind(th));
g=-9.8;
%from the equation: y=(Vy*t)+((.5)*(Ay)*(t^2)), formula for t was derived
t=abs((-(Vy)-(sqrt((Vy.^2)-4.*(.5*(Ay)).*(H))))./(2.*((.5)*Ay)));
tt=abs((Vy/Ay)-abs(sqrt(((Vy^2)/(Ay^2))-((2*H)/(Ay)))));
ttt=abs((-(Vy)-(sqrt((Vy.^2)-4.*(.5*(g)).*(H))))./(2.*((.5)*g)));
tttt=abs((Vy/g)-abs(sqrt(((Vy^2)/(g^2))-((2*H)/(g)))));

if V==0
    error('Velocity cannot be zero')
elseif V<0
    error('Magnitude of velocity cannot be negative')
elseif (th<0)||(th>180)
    error('Angle must not be less than 0 degrees and must not exceed 180 degrees')
elseif H==0
    for i=0:ttt
        n=0:0.0001:ttt;
        YI=H+(Vy.*n)+((.5).*(g).*(n.^2));
        XI=(Vx*n);
    end
else
    for i=0:tttt
        n=0:0.0001:tttt;
        YI=H+(Vy.*n)+((.5).*(g).*(n.^2));
        XI=(Vx*n);
    end
end

if Ay==0
    error('Y-component of the acceleration cannot be zero')
elseif H<0
    error('Height must be above the reference point which is the ground')
elseif V==0
    error('Velocity cannot be zero')
elseif V<0
    error('Magnitude of velocity cannot be negative')
elseif (th<0)||(th>180)
    error('Angle must not be less than 0 degrees and must not exceed 180 degrees')
elseif H==0
    for i=0:t
        n=0:0.0001:t;
        Y=H+(Vy.*n)+((.5).*(Ay).*(n.^2));
        X=(Vx*n)+((.5).*(Ax)*(n.^2));
    end
else
    for i=0:tt
        n=0:0.0001:tt;
        Y=H+(Vy.*n)+((.5).*(Ay).*(n.^2));
        X=(Vx*n)+((.5).*(Ax)*(n.^2));
    end
end
subplot(2,1,1)
plot(X,Y, 'linewidth',2)
xlabel('Range')
ylabel('Height')
title('Non-Ideal Trajectory of the Projectile')
grid on
subplot(2,1,2)
plot(XI,YI, 'linewidth',2)
xlabel('Range')
ylabel('Height')
title('Ideal Trajectory of the Projectile')
grid on


