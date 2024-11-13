clc;clear;close all;


R = 3;
V_target = 30;
h = 1.5;
iterations = 100;
errors = zeros(1, iterations);

for i = 1:iterations
    V = pi .* h.^2. * (3 .* R - h) ./ 3;
    f = V - V_target;
    f_prime = pi .* h .* (6 .* R - 3 .* h) ./ 3;
    h_new = h - f ./ f_prime;
    errors(i) = abs((h_new - h) ./ h_new) .* 100;
    h = h_new;
end

disp(['final h: ' num2str(h)])

plot(1:iterations, errors, Marker="o", MarkerFaceColor="k", MarkerEdgeColor='k',...
    MarkerSize=3)
xlabel('Iteration')
ylabel('Approximate Relative Error (%)')
ylim([-10 40])
xlim([-5 105])
grid on
title('نمودار خطای نسبی')

%----------------------------------------------------------------------
