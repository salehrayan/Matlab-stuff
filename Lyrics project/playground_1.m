clc;clear;close all;
[signal, Fs] = audioread("C:\Users\ASUS\Downloads\Telegram Desktop\Bloodbound - Guardians at Heaven s Gate.mp3");
channel1 = signal(:, 1);
channel2 = signal(:,2);
start  = 40;   % 43 second start of vocalist sound
endpoint = 55;
signal_downsampled_2 = downsample(signal, 2);
Fs_downsampled_2 = Fs/2;

% sound(signal_downsampled_2(start*Fs_downsampled_2 +1:endpoint*Fs_downsampled_2),...
%     Fs_downsampled_2);
% sound(signal(start*Fs +1:endpoint*Fs),...
%     Fs);
channel1_from30to60 = channel1(start*Fs +1:endpoint*Fs);
13*Fs

