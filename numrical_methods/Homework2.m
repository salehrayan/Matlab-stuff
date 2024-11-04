clc;clear;close all;

% Define the value where we want to approximate cos(x)
x = pi / 3;

% True value of cos(pi/3)
true_value = cos(x);

% Call the function to get the number of terms required
n_terms = taylor_series_cos_around_pi4(x);

% Display the result
fprintf('Number of terms needed for approximation of cos(pi/3) around pi/4: %d\n', n_terms);



function n = taylor_series_cos_around_pi4(x)
    % This function calculates the number of terms needed in the Taylor series expansion
    % of cos(x) around pi/4 to achieve a relative error less than 1e-5 (0.001%).
    % The relative error is calculated as the difference between successive terms.
    
    % The center of the Taylor series
    a = pi / 4;
    
    % Initialize the Taylor series sum
    approx_value = 0;     % The sum of the Taylor series terms
    term = cos(a);        % The first term is cos(pi/4)
    n = 0;                % Number of terms
    relative_error = 1;    % Initialize relative error to a large number
    
    % Start adding terms of the Taylor series until relative error < 1e-5
    while relative_error > 1e-5
        % Store the previous term (T_n)
        previous_term = term;
        
        % Add the current term to the approximation
        approx_value = approx_value + term;
        
        % Increment the number of terms
        n = n + 1;
        
        % Calculate the next term in the Taylor series
        if mod(n, 2) == 1
            term = (-1)^(n) * sin(a) * (x - a)^n / factorial(n);  % Odd terms: derivatives of sin
        else
            term = (-1)^(n/2) * cos(a) * (x - a)^n / factorial(n); % Even terms: derivatives of cos
        end
        
        % Calculate the relative error as |T_{n+1} - T_n| / |T_{n+1}|
        relative_error = abs(term - previous_term) / abs(term);
    end
end


