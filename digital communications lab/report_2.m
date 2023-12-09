clc;clear; close all;

N0 = 1;
Ps = -10:1:30; %db
eta = 0.1:0.001:15;

SNR = (2.^eta - 1)./eta; %power of 1 bit per noise power per 1 hertz
SNRdB = 10.*log10(SNR);%db

Psl = 10.^(Ps/10);
B = 1;

C = B.*log2(1+Psl/N0);

fig1 = figure;
subplot(2,1,1)
plot(Ps, C, LineWidth=1.5)
ylabel('Channel capacity (bits/sec)', 'FontSize',15)
xlabel('Signal power (dB)', 'FontSize',15)

subplot(2,1,2)
semilogy(SNRdB, eta, LineWidth=1.5)
ylabel('Data rate in 1 hertz (bits/sec/Hz)', 'FontSize',15)
xlabel('Power of 1 bit per noise power per 1 hertz (dB)', 'FontSize',15)

fig1.Position = [500 150 800 800];