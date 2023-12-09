clc;clear;close all;

b = [1 0 0 1 1 1 0 1 0 1 1 0];
t = 0:0.001:1; 
T = 0:0.001:length(b);
Signal1 = [];
Signal2 = [];
Fi = [2 10]; 
Fc = 5;

for i=1:length(b)
    s1= sin(2.*pi.*Fi(b(i)+1).*t)./(sum(abs(sin(2.*pi.*Fi(b(i)+1).*t)).^2));
    Signal1 = cat(2, Signal1, s1);

    s2= sin(2.*pi.*(Fc + Fi(b(i)+1)).*t)./(sum(abs(sin(2.*pi.*(Fc + Fi(b(i)+1)).*t)).^2));
    Signal2 = cat(2, Signal2, s2);
end


figure
subplot(2,1,1)
stairs(0:length(b), [b b(end)], 'LineWidth', 1.5)
title('Signal bits')
ylim([-1.5 1.5])
xlim([0 length(b)])

subplot(2,1,2)
plot(T, Signal1(1:end-(length(b)-1)), 'LineWidth',1.5)
title('Full modulated signal')
xlim([0 length(b)])
ylim([-0.005 0.005])

figure
subplot(2,1,1)
stairs(0:length(b), [b b(end)], 'LineWidth', 1.5)
title('Signal bits')
ylim([-1.5 1.5])
xlim([0 length(b)])

subplot(2,1,2)
plot(T, Signal2(1:end-(length(b)-1)), 'LineWidth',1.5)
title('Full modulated signal')
xlim([0 length(b)])
ylim([-0.005 0.005])

