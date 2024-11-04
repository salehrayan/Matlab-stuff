clc;clear;close all;

% Constants
mu0 = 4 * pi * 1e-7;   % Permeability of free space (H/m)
I0 = 1;                % Amplitude of the current (A)
f = 50;                % Frequency (Hz)
omega = 2 * pi * f;    % Angular frequency (rad/s)
T = 5 / f;             % Period (s)
R = 1;                 % Radius of the circle (m)

% Wire positions
theta_i = (0:5) * pi / 3;  % Angles for 6 points (0 to 5π/3)
x_i = R * cos(theta_i);    % x-coordinates of wires
y_i = R * sin(theta_i);    % y-coordinates of wires

% Grid for magnetic field calculation
x_min = -2 * R; x_max = 2 * R;
y_min = -2 * R; y_max = 2 * R;
Nx = 40; Ny = 40;           % Number of grid points (adjusted for clarity)
x = linspace(x_min, x_max, Nx);
y = linspace(y_min, y_max, Ny);
[X, Y] = meshgrid(x, y);

% Time vector
Nt = 300;                      % Number of time steps (increased for smoother waveforms)
t_vec = linspace(0, T, Nt);

% Initialize storage for currents (only three phases)
I_store = zeros(Nt, 3);

% Create figures for magnetic field and current waveforms
figure('Position', [50, 100, 800, 600]); % Figure for magnetic field
figure('Position', [900, 100, 600, 400]); % Figure for current waveforms

% Main loop over time
for t_idx = 1:Nt
    t = t_vec(t_idx);
    
    % Currents in each wire (phases offset by 120 degrees)
    I1 = I0 * sin(omega * t);
    I2 = I0 * sin(omega * t - 2 * pi / 3);  % -120 degrees
    I3 = I0 * sin(omega * t - 4 * pi / 3);  % -240 degrees
    I4 = -I1;  % Opposite current
    I5 = -I2;  % Opposite current
    I6 = -I3;  % Opposite current
    I_all = [I1, I2, I3, I4, I5, I6];
    
    % Store three phase currents for plotting
    I_store(t_idx, :) = [I1, I2, I3];
    
    % Initialize magnetic field components for this time step
    Bx_total = zeros(Ny, Nx);
    By_total = zeros(Ny, Nx);
    
    % Loop over each wire
    for i = 1:6
        x0 = x_i(i);
        y0 = y_i(i);
        Ii = I_all(i);
        
        % Compute distance components
        rx = X - x0;
        ry = Y - y0;
        r_squared = rx.^2 + ry.^2;
        
        % Avoid division by zero
        r_squared(r_squared < 1e-12) = 1e-12;
        
        % Magnetic field contributions
        factor = (mu0 * Ii) ./ (2 * pi * r_squared);
        Bx = -factor .* ry;
        By = factor .* rx;
        
        % Sum contributions from all wires
        Bx_total = Bx_total + Bx;
        By_total = By_total + By;
    end
    
    % Compute magnetic field magnitude
    B_magnitude = sqrt(Bx_total.^2 + By_total.^2);
    
    % --- Plot Magnetic Field ---
    figure(1);
    clf; % Clear current figure
    % Plot magnetic field vectors using quiver
    quiver(X, Y, Bx_total, By_total, 'AutoScaleFactor', 1.2, 'Color', 'b');
    hold on;
    
    % Plot the wires with current direction indicators
    for i = 1:6
        % Determine current direction
        if I_all(i) > 0
            marker = 'ro'; % Red circle for current out of the plane
        else
            marker = 'bx'; % Blue cross for current into the plane
        end
        plot(x_i(i), y_i(i), marker, 'MarkerSize', 10, 'LineWidth', 2);
    end
    
    % Draw the circle representing the wire arrangement
    ang = linspace(0, 2*pi, 100);
    plot(R*cos(ang), R*sin(ang), 'k--');
    
    % Annotations
    title(sprintf('Magnetic Field Vectors at t = %.2f ms', t*1000));
    xlabel('x (m)');
    ylabel('y (m)');
    axis equal;
    axis([x_min x_max y_min y_max]);
    legend({'Magnetic Field', 'Current Out (+)', 'Current In (-)', 'Wire Circle'}, 'Location', 'best');
    grid on;
    hold off;
    drawnow;
    
    % --- Plot Three-Phase Current Waveforms ---
    figure(2);
    clf; % Clear current figure
    plot(t_vec(1:t_idx)*1000, I_store(1:t_idx, :), 'LineWidth', 2);
    hold on;
    % Mark the current time
    plot(t*1000, I_store(t_idx, :), 'ko', 'MarkerFaceColor', 'k');
    hold off;
    xlabel('Time (ms)');
    ylabel('Current (A)');
    title('Three-Phase Current Waveforms');
    legend({'I1', 'I2', 'I3'}, 'Location', 'best');
    grid on;
    xlim([0, T*1000]); % x-axis from 0 to one period in milliseconds
    ylim([-I0*1.2, I0*1.2]); % y-axis limits slightly beyond current amplitude
    drawnow;
    
    % Optional: Pause for animation effect
    % pause(0.05);
end
