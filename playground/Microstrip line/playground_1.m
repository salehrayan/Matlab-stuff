clc;clear;close all;
microstrip = design(microstripLine,2e9,'Z0',70,'LineLength',0.1);
% show(microstrip)
current(microstrip, 2e6)