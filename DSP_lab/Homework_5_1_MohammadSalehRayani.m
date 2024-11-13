% تمرین: برنامه را برای ;۵ : ۰ = x و ۳ = p اجرا کنید و با دستور (xtilde(stem نتیجه را مشاهده کنید و برنامه را
% توضیح دهید.

clc;clear;close all;

x = 0:5;
p = 3;
xtilde = CopyP_x(x, p);
stem(xtilde);

function xtilde = CopyP_x(x, p)
    xtilde = x' * ones(1, p);
    xtilde = xtilde(:);
    xtilde = xtilde';
end

%-------------------------------------------------------------------