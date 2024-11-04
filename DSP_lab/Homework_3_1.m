clc;clear;close all;

j=0;

for i=1:3000000
x = randi([-1 1], 1, 5);
j = j + (sum(x) == 5) .* 1;
end

disp("experiment: " + j/3000000)
disp("theoretical: " + (1/3).^5)



