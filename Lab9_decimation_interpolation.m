clc; 
clear; 
close all;

% Parameters
fm = 9;                     % Frequency of the sine wave
fs_original = 1000;         % Original sampling frequency (Hz)
t_original = 0:1/fs_original:1;  % Original time vector (1 second duration)

% Original sine wave
a_original = sin(2 * pi * fm * t_original); 

% Decimation
downsample_factor = 25;   % Downsample by this factor
a_decimated = a_original(1:downsample_factor:end);  % Downsampled signal
t_decimated = t_original(1:downsample_factor:end);  % Time vector for decimated signal

% Interpolation
upsample_factor = 25;     % Upsample by this factor
t_interpolated = linspace(t_decimated(1), t_decimated(end), length(t_decimated) * upsample_factor);
a_interpolated = interp1(t_decimated, a_decimated, t_interpolated, 'linear'); 

% Plotting
figure;

% Original Signal
subplot(3, 1, 1);
plot(t_original, a_original, 'b'); 
title('Original Sine Wave');
xlabel('Time (s)'); 
ylabel('Amplitude'); 
grid on;

% Decimated Signal
subplot(3, 1, 2);
stem(t_decimated, a_decimated, 'r', 'LineWidth', 1); 
title('Decimated Sine Wave');
xlabel('Time (s)'); 
ylabel('Amplitude'); 
grid on;

% Interpolated Signal
subplot(3, 1, 3);
plot(t_interpolated, a_interpolated, 'g', 'LineWidth', 1); 
title('Interpolated Sine Wave');
xlabel('Time (s)'); 
ylabel('Amplitude'); 
grid on;

% Adjust layout
sgtitle('Signal Decimation and Interpolation'); % Add a common title
