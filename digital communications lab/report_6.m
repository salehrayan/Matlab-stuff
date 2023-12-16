clc;clear;close all;
snr = -4:0.1:14;
psk_ser(snr, 6)




function psk_ser(snr_db, n)
    for i=1:n
        M = 2.^(i);
        if M==2   %BPSK%
            snr_lin = 10.^(snr_db/10);
            gamma_b = snr_lin;

            SER = erfc(sqrt(gamma_b))./2;
            semilogy(snr_db, SER, 'DisplayName','B-PSK', LineWidth=1.5)
            hold on
        elseif M==4   %QPSK%
            snr_lin = 10.^(snr_db/10);
            gamma_b = snr_lin;

            SER = erfc(sqrt(gamma_b)) - (erfc(gamma_b)./2).^2;
            semilogy(snr_db, SER, 'DisplayName','Q-PSK', LineWidth=1.5)
            hold on
        elseif M>4    %MPSK%
            snr_lin = 10.^(snr_db/10);
            gamma_s = log2(M).*snr_lin;

            SER = erfc(sin(pi./M).*sqrt(gamma_s));
            semilogy(snr_db, SER, 'DisplayName',num2str(M)+"-PSK", LineWidth=1.5)
            hold on
        end
        legend(Location='southwest')
        xlabel('SNR (dB)')
        ylabel('SER')
    end
end






