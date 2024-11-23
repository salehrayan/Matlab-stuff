clc;clear;close all;

n = -50:50;
x1 = sin(0.125 * pi * n);
M = 4;

[y1, m1] = dnsample(x1, n, M);

figure;
subplot(2,1,1);
stem(n, x1, 'filled');
title('x[n] = sin(0.125\pin)');
xlabel('n');
ylabel('x[n]');

subplot(2,1,2);
stem(m1, y1, 'filled');
title('downsampled signal');
xlabel('n');
ylabel('y[n]');

x2 = sin(0.5 * pi * n);
[y2, m2] = dnsample(x2, n, M);

figure;
subplot(2,1,1);
stem(n, x2, 'filled');
title('x[n] = sin(0.5\pin)');
xlabel('n');
ylabel('x[n]');

subplot(2,1,2);
stem(m2, y2, 'filled');
title('downsampled signal');
xlabel('n');
ylabel('y[n]');
ylim([-1 1])


function [y, m] = dnsample(x, n, M)
    y = x(1:M:end);
    m = n(1:M:end);
end