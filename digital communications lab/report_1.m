clc;clear;close all;

A = 1;
F = 5;
ovs = 30;
Fs = ovs .* F*100*3;
omega = 2 .* pi .*F;
phase = 0;
n= 15;
t = 0:1/Fs:n/F - 1/Fs;

chirp_rate = 50;
F_chirp = 5 +chirp_rate*t;
omega_chirp = 2 .* pi .*F_chirp;
y_chirp = A.*sin(omega_chirp.*t + phase);

Width = 2;
t2 = -Width:1/Fs:Width-1/Fs;
pulse = zeros([1,length(t2)]);
pulse(t2>-Width/2 & t2<Width/2) = 1;

y = A.*sin(omega.* t + phase);
z = y;

z(abs(z)<10.^-4) = 0;
z(z>0) = 1;
z(z<0) = -1;

fig1 = figure;

subplot(3,1,1)
plot(t, y, LineWidth=1.5)
title(['Sinusoidal wave, frequency: ', num2str(F),'Hz']);
xlabel('time (s)');
ylabel('Sin(t)');
ylim([-2 2]);

subplot(3,1,2)
plot(t, z, LineWidth=1.5)
title('Periodic square wave')
xlabel('time (s)');
ylim([-2 2]);

subplot(3,1,3)
plot(t2, pulse, LineWidth=1.5)
title(['Square pulse, width: ', num2str(Width)])
xlabel('time (s)');
ylim([-2 2]);

fig1.Position = [50, 150 ,800, 800];

fig2 = figure;
plot(t(1:length(t)/4), y_chirp(1:length(t)/4), LineWidth=1.5)
title(['Linear chrip with chirp rate: ' ,num2str(chirp_rate)])
xlabel('time (s)');
ylim([-2 2]);

fig2.Position = [700, 150 ,800, 800];

sound(2.*y_chirp, Fs)