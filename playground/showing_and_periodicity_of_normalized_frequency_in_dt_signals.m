clc;clear;close all
% showing that f(Fcontinous/Fs) is periodic with 1, that is, sin(2pi 0.5 n)
% gives the same plot as sin(2pi 1.5 n), the latter signal is aliasing as
% the first signal
L=3;
Fs = 5;
Ts = 1/Fs;

n=-L:Ts:L; % learned my lesson. Ts is the best way to go
t = linspace(-L, L , 5000);


singal1_real = cos(2.*pi.*1.*t);
singal2_real = cos(2.*pi.*11.*t);

signal1 = cos(2.*pi.*1.*n);
signal2 = cos(2.*pi.*11.*n);


fig1 = figure(1);
fig1.Position(:) = [50 300 900 680];
subplot(2,1,1)
plot(t, singal1_real)
ylim([-1 1])
hold on
plot(n, signal1, 'o', 'MarkerFaceColor', 'blue', MarkerSize=7)
hold off



subplot(2,1,2)
plot(t, singal2_real)
ylim([-1 1])
hold on
plot(n, signal2, 'o', 'MarkerFaceColor', 'blue', MarkerSize=7)
hold off




