clc;clear;close all;

L = 10; 
n_segments = 100; 
n_nodes = n_segments + 1; 
dx = L / n_segments; 
h_prime = 0.02; 
T_a = 20; 
T_0 = 40; 
T_L = 200; 

alpha = h_prime * dx^2; % محاسبه مقدار ثابت در معادله

A = zeros(n_nodes, n_nodes);
b = zeros(n_nodes, 1);

b(1) = T_0;
b(end) = T_L;

for i = 2:n_nodes-1
    A(i, i-1) = -1;
    A(i, i) = 2 + alpha;
    A(i, i+1) = -1;
    b(i) = alpha * T_a;
end

A(1, 1) = 1;
A(end, end) = 1;

T = A \ b;  %همان (معکوس آ) ضربدر بی

x_positions = linspace(0, L, n_nodes);

fprintf('دما           موقعیت\n');
for i = 1:n_nodes
    fprintf('%.2f    %.4f\n', x_positions(i), T(i));
end

figure;
plot(x_positions, T, '-o', 'LineWidth', 1.5);
xlabel('موقعیت روی میله (متر)');
ylabel('دما (C)');
title('توزیع دما در طول میله');
grid on;
