% Name: Mohammad Saleh Rayani

clc;clear;close all;

A = rand(3,5); 
B = rand(2,4); 
C = rand(3,3); 
D = rand(1,8); 
E = rand(2,4); 

AC = [A C]; 
BE = [B E]; 
Result = [AC; BE; D]; 

disp(Result);
disp(['Result Dimension: ' num2str(size(Result, 1)) ', ' num2str(size(Result, 2))])

