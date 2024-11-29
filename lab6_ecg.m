clc; 
load('100m.mat');  % Load ECG data from .mat file 
ECGsignal = (val - 1024) / 200;  % Scale the ECG data 
Fs = 360;  % Sampling frequency 
t = (0:length(ECGsignal) - 1) / Fs;  % Time vector 
plot(t, ECGsignal);  % Plot the ECG signal 
title('ECG Signal from .mat File'); 
xlabel('Time (seconds)'); 
ylabel('ECG Amplitude');