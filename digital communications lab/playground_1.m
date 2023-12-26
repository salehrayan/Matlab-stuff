clc; clear; close all;

syms q
SNR = -4:1:14;

M = 2;
y = (10.^(SNR./10));
gamma_s = y;

for n=1:length(gamma_s)

    f(q) = (((1/2)*erfc(-q-sqrt(2*gamma_s(n))/sqrt(2))).^(M-1))*(1/sqrt(2.*pi))*exp((-q.^2)/2);
    SER(n) = 1 - int(f, -inf, inf);
end
semilogy(SNR, SER)

