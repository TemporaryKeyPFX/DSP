clc; 
clear all; 
close all; 

% Sampling frequency
fs = 8000;  % Standard DTMF sampling frequency

% Time vector (200 ms duration)
t = 0:1/fs:0.2;  

% Input for DTMF signal
x = input("Enter the input number (0-9, 11 for Start, 12 for Cancel): ");  

% Define row and column frequencies (Hz)
fr = [697, 770, 852, 941];      % Row frequencies
fc = [1209, 1336, 1477, 1633];  % Column frequencies

% Generate DTMF signals corresponding to different keys
signals = { 
    sin(2*pi*fr(1)*t) + sin(2*pi*fc(1)*t);  % 1
    sin(2*pi*fr(1)*t) + sin(2*pi*fc(2)*t);  % 2
    sin(2*pi*fr(1)*t) + sin(2*pi*fc(3)*t);  % 3
    sin(2*pi*fr(2)*t) + sin(2*pi*fc(1)*t);  % 4
    sin(2*pi*fr(2)*t) + sin(2*pi*fc(2)*t);  % 5
    sin(2*pi*fr(2)*t) + sin(2*pi*fc(3)*t);  % 6
    sin(2*pi*fr(3)*t) + sin(2*pi*fc(1)*t);  % 7
    sin(2*pi*fr(3)*t) + sin(2*pi*fc(2)*t);  % 8
    sin(2*pi*fr(3)*t) + sin(2*pi*fc(3)*t);  % 9
    sin(2*pi*fr(4)*t) + sin(2*pi*fc(2)*t);  % 0
    sin(2*pi*fr(4)*t) + sin(2*pi*fc(1)*t);  % Start (11)
    sin(2*pi*fr(4)*t) + sin(2*pi*fc(3)*t)   % Cancel (12)
}; 

% Validate input and plot the DTMF signal
if x >= 0 && x <= 12 
    signal = signals{x + 1};  % Access the correct signal from the cell array
    signal = signal / max(abs(signal));  % Normalize the signal
    figure;  % Create a new figure for plotting
    plot(t, signal);  % Plot the selected DTMF signal
    xlabel("Time (s)"); 
    ylabel("Amplitude"); 
    title(['DTMF Signal for Key ', num2str(x)]); 
else 
    disp("Invalid input. Please enter a number between 0-9, 11 for Start, or 12 for Cancel."); 
end
