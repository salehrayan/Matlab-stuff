clc;clear;close all;
syms phi


markers = 'sv*po';
SNR = -10:20;
figure
for n= 1:5
    M= 2.^n;
    gamma_s = 10.^(SNR./10).*log2(M);
    g = sin(pi./M).^2;
    f(phi) = (1+ (g.*gamma_s./(sin(phi)).^2)).^(-1)./pi;
    SER = int(f, phi, 0, (M-1)./M.*pi);
    semilogy(SNR, SER, 'DisplayName', num2str(M)+"-PSK", 'Marker',markers(n), 'LineWidth', 1.5)
    drawnow
    hold on
end
legend('Location','southwest')
xlabel('SNR (dB)')
ylabel('SER')

