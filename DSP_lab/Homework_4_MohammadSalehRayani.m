clc;clear;close all;

data = randi(1000, 100, 60);
evens = data(data/2 == floor(data/2));
odds = data(data/2 ~= floor(data/2));

num_evens = numel(evens);
num_odds = numel(odds);
mean_evens = mean(evens);
mean_odds = mean(odds);

disp(['تعداد اعداد زوج: ' num2str(num_evens)]);
disp(['تعداد اعداد فرد: ' num2str(num_odds)]);
disp(['میانگین اعداد زوج: ' num2str(mean_evens)]);
disp(['میانگین اعداد فرد: ' num2str(mean_odds)]);

% -----------------------------------------------------------