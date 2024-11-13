% تمرین: برنامه ی جمع را برای مقادیر زیر اجرا و تفسیر کنید

clc;clear;close all;

x1 = [10 5 8 1 4];
n1 = -1:3;

x2 = [9 8 10 7 0 8 9];
n2 = -2:4;

[y, n] = sigadd(x1, n1, x2, n2);
stem(n, y);

function [y, n] = sigadd(x1, n1, x2, n2)
    n = min(min(n1), min(n2)):max(max(n1), max(n2));
    y1 = zeros(1, length(n));
    y2 = y1;
    y1((n >= min(n1)) & (n <= max(n1)) == 1) = x1;
    y2((n >= min(n2)) & (n <= max(n2)) == 1) = x2;
    y = y1 + y2;
end

%---------------------------------------------------------------

