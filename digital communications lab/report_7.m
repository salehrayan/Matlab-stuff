clc;clear;close all;
syms q

gamma_s = -4:0.5:14;
gamma_lin = 10.^(gamma_s./10);
% gamma_lin = 1;
M = 2;

for i=1:length(gamma_lin)
    f(q) = (1./2.*erfc(-q - sqrt(gamma_lin(i).*2))).^(M-1)./(sqrt(2.*pi)).*exp(-q.^2./2);
    SER(i) = 1- int(f, q, -inf, inf)
end


