clc; clear;


S = 28.77;
demand_factor = 1;
cos_phi = 1;
l = 10;

alpha = 3;
V = 230;

current = 28.77;
s_from_vDrop = 200.*0.0225.*current.*l.*cos_phi./alpha./V;
disp(['Current: ' num2str(current)])
disp(['s_from_vDrop: ' num2str(s_from_vDrop)])

s = input('input s:');
current_sc_min = V.*0.95./(0.35 + (2.*0.0225.*l./s));


disp(['Current_shortCircuit_minimum: ' num2str(current_sc_min)])


