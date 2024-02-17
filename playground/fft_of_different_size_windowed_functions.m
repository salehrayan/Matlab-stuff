clc;clear;close all
L=20;
n=3048;
Fs = n/(2*L);
t=linspace(-L,L,n);

signal = cos(2.*pi.*2.*t) + sin(2.*pi.*2.5.*t);
rect_window = rectpuls(t,2);
std = 0.40;
gaussian_window = exp(-1/2 * (t/std).^2);

fourier_main = fft(signal);
fourier_windowed = fft(signal.*rect_window);
fourier_gaussian_windowed = fft(signal.*gaussian_window);
f = (-n/2:n/2-1).*Fs / n;

fig1 = figure(1);
fig1.Position(:) = [50 300 720 680];
subplot(3,1,1)
p = plot(t,rect_window, t, signal);
p(1).LineWidth = 2;
xlim([-2,2]);

subplot(3,1,2)
plot(f,abs(fftshift(fourier_main))/...
    max(abs(fftshift(fourier_main))),LineWidth=1.5)
xlim([-10 10]);

subplot(3,1,3)
plot(f, abs(fftshift(fourier_windowed))...
    /max(abs(fftshift(fourier_windowed))),LineWidth=1.5)
xlim([-15 15]);


fig2 = figure(2);
fig2.Position(:) = [800 300 720 680];

subplot(3,1,1)
p2 = plot(t,gaussian_window, t, signal);
p2(1).LineWidth = 2;
xlim([-2,2]);


subplot(3,1,2)
plot(f,abs(fftshift(fourier_main))/max(abs(fftshift(fourier_main))),...
    LineWidth=1.5)
xlim([-10 10]);

subplot(3,1,3)
plot(f, abs(fftshift(fourier_gaussian_windowed))/...
    max(abs(fftshift(fourier_gaussian_windowed))),LineWidth=1.5)
xlim([-15 15]);






