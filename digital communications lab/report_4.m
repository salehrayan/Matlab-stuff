clc;clear;close all;

b = [1 0 0 1 1 1 0 1 0 1 1 0];      %بیت های ارسالی
t = 0:0.01:1;   %زمان یک پالس
T = 0:0.01:length(b);   %زمان کل سیگنال
Signal = [];        %ایجاد متغیر خالی برای جمع کردن سیگنال ها در آینده
Fc = 5;     %فرکانس حامل

for i=1:length(b)    %انیمیشن مدولاسیون
    subplot(2,1,1)
    stairs(0:length(b), [b b(end)], 'LineWidth', 1.5)      %تابع برای کشیدن پله
    title('Signal bits')
    ylim([-1.5 1.5])        %محدود کردن محور عمودی
    xlim([0 length(b)])     %محدود کردن محور افقی

    s= sin(2.*pi.*Fc.*t + b(i).*pi)./(sum(abs(sin(2.*pi.*Fc.*t + b(i).*pi)).^2));       %سیگنال مدوله شده در زمان یک پالس
    subplot(2,1,2)
    plot(t + (i-1), s, LineWidth=1.2)
    title('Modulated bit')
    xlim([0 length(b)])
    ylim([-0.05 0.05])

    drawnow     %کشیدن فوری پلات روی فیگر
    pause(0.5)      %صبر 0.5 ثانیه ای

    Signal = cat(2, Signal, s);     %جمع کردن سیگنالهای مدوله شده در زمان یک پالس
end
close   %بستن فیگر
figure   %باز کردن فیگر

%نمایش کل سیگنال مدوله شده
subplot(2,1,1)
stairs(0:length(b), [b b(end)], 'LineWidth', 1.5)
title('Signal bits')
ylim([-1.5 1.5])
xlim([0 length(b)])

subplot(2,1,2)
plot(T, Signal(1:end-(length(b)-1)), 'LineWidth',1.5)
title('Full modulated signal')
xlim([0 length(b)])
ylim([-0.05 0.05])


