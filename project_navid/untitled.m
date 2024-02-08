clc; clear; close all;


L  =10;
P = 7;
len = 10*L;


len_output = len+P-1;
x = rand(1, len)*5;
h_n = rand(1, P)*3;
h_n_fft = fft(h_n, L+P-1);
result = zeros(1, len_output);


fig1 = figure;
fig1.Position(1:2) = [575 50];
plot(conv(x,h_n), LineWidth=2)
xlim([1 len_output])
title('MATLAB convolution of full signal')

figure
for i=1:len/L
    temp = x(1+(i-1)*L:L*i);
    fft_temp = fft(temp, P+L-1);
    fft_output = fft_temp.*h_n_fft;
    result = [zeros(1,(i-1)*L) real(ifft(fft_output)) zeros(1, len_output-16-(i-1).*L)] + result;
    plot(result, LineWidth=2)
    xlim([1 len_output])
    drawnow
    title('Overlap and add method')
    pause(0.7)
end


