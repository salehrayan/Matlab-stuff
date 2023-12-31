clc;clear;close all;
syms q

gamma_s = -4:0.5:14;
gamma_lin = 10.^(gamma_s./10);
markers = 'sxvpo';

for n = 1:5
    M = 2.^n;
    x = log2(M).*gamma_lin;
    for i=1:length(gamma_lin)
        f(q) = (1./2.*erfc(-q - sqrt(x(i).*2))).^(M-1)./(sqrt(2.*pi)).*exp(-q.^2./2);
        SER(i) = 1- int(f, q, -inf, inf);
    end
    semilogy(gamma_s, SER, 'DisplayName', [num2str(M) '-FSK'], LineWidth=1.5, Marker=markers(n)) 
    hold on
end

legend('Location','southwest')
ylim([10.^(-15) 1])
ylabel('SER')
xlabel('SNR (dB)')



