clc;clear; close all;

% Define the function
syms x;
f = -0.1*x^4 - 0.15*x^2 - 0.5*x^2 - 0.25*x + 1.2;

% Point of expansion
x0 = 0;

% Point to evaluate the approximation
x_val = 0.1;

% Approximate values keeping different number of terms
% First term (0th order, constant term)
T0 = taylor(f, x, 'Order', 1);
approx_T0 = double(subs(T0, x, x_val));

% Up to second term (1st order, includes linear term)
T1 = taylor(f, x, 'Order', 2);
approx_T1 = double(subs(T1, x, x_val));

% Up to third term (2nd order, includes quadratic term)
T2 = taylor(f, x, 'Order', 3);
approx_T2 = double(subs(T2, x, x_val));

% Up to fourth term (3rd order, includes cubic term)
T3 = taylor(f, x, 'Order', 4);
approx_T3 = double(subs(T3, x, x_val));

% Up to fifth term (4th order, includes quartic term)
T4 = taylor(f, x, 'Order', 5);
approx_T4 = double(subs(T4, x, x_val));

% Display the results
disp('Approximate values at x = 0.1 with different number of terms:');
fprintf('Keeping first term (0th order): %.6f\n', approx_T0);
fprintf('Keeping up to second term (1st order): %.6f\n', approx_T1);
fprintf('Keeping up to third term (2nd order): %.6f\n', approx_T2);
fprintf('Keeping up to fourth term (3rd order): %.6f\n', approx_T3);
fprintf('Keeping up to fifth term (4th order): %.6f\n', approx_T4);
