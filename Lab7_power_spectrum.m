clc; 
clear all; 
close all; 
% Parameters 
N = 1024;             
fs = 8000;            
% Number of samples 
% Sampling frequency in Hz 
f = input("Enter the frequency [1 to 5000]: "); % Frequency of the sine wave 
n = 0:N-1;           
% Sample indices 
% Generate the sinusoidal signal 
x = sin(2 * pi * (f / fs) * n); 
% Plot the time-domain signal 
t = n / fs;          
% Time vector 
figure; 
% Time Domain Plot 
subplot(4, 1, 1); 
plot(t, x); 
title('Time Domain Signal'); 
xlabel('Time (seconds)'); 
ylabel('Amplitude'); 
grid on; 
% Compute the FFT of the signal 
X = fft(x); 
X_magnitude = abs(X / N); % Normalize the FFT output 
f_vector = (0:N-1) * (fs / N); % Frequency vector 
% Frequency Spectrum Plot 
subplot(4, 1, 2); 
plot(f_vector(1:N/2), X_magnitude(1:N/2)); % Plot only the positive frequencies 
title('Frequency Spectrum'); 
xlabel('Frequency (Hz)'); 
ylabel('Magnitude'); 
xlim([0 fs/2]); % Limit x-axis to Nyquist frequency 
grid on; 
% Compute the Power Spectrum 
power_spectrum = (X_magnitude.^2); % Power spectrum (magnitude squared) 
subplot(4, 1, 3); 
plot(f_vector(1:N/2), power_spectrum(1:N/2)); % Plot only the positive frequencies 
title('Power Spectrum'); 
xlabel('Frequency (Hz)'); 
ylabel('Power'); 
xlim([0 fs/2]); % Limit x-axis to Nyquist frequency 
grid on; 
% Energy Spectrum (same as power spectrum for discrete signals) 
energy_spectrum = power_spectrum; % Energy spectrum 
subplot(4, 1, 4); 
plot(f_vector(1:N/2), energy_spectrum(1:N/2)); % Plot only the positive frequencies 
title('Energy Spectrum'); 
xlabel('Frequency (Hz)'); 
ylabel('Energy'); 
xlim([0 fs/2]); % Limit x-axis to Nyquist frequency 
grid on; 
% Display message 
disp('Time Domain, Frequency Spectrum, Power Spectrum, and Energy Spectrum computed and displayed.');