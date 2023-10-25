clc;clear;close all;
% find rows and columns of a matrix with specific conditions

A = magic(5)

[row, col] = find(A > 15)
