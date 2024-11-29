clc;
clear all;
close all;

% Parameters
n = 20;              % Filter order
fs = 1000;           % Sampling frequency

% High-Pass Filter (HPF)
fp_hpf = 300;        % Passband frequency for HPF
fq_hpf = 200;        % Stopband frequency for HPF
fn_hpf = 2 * fp_hpf / fs;  % Normalized frequency for HPF

% Apply Blackman window for HPF
window_hpf = blackman(n + 1);

% Design High-Pass Filter
b_hpf = fir1(n, fn_hpf, 'high', window_hpf);

% Frequency response for HPF
[H_hpf, W_hpf] = freqz(b_hpf, 1, 128);

% Low-Pass Filter (LPF)
fp_lpf = 200;        % Passband frequency for LPF
fq_lpf = 300;        % Stopband frequency for LPF
fn_lpf = 2 * fp_lpf / fs;  % Normalized frequency for LPF

% Apply Blackman window for LPF
window_lpf = blackman(n + 1);

% Design Low-Pass Filter
b_lpf = fir1(n, fn_lpf, window_lpf);

% Frequency response for LPF
[H_lpf, W_lpf] = freqz(b_lpf, 1, 128);

% Plotting

% Plot magnitude response of HPF
figure;
plot(W_hpf / pi, abs(H_hpf), 'r', 'LineWidth', 1.5);
title('Magnitude Response of HPF');
ylabel('Gain (dB)');
xlabel('Normalized Frequency');
grid on;

% Plot phase response of HPF
figure;
plot(W_hpf / pi, angle(H_hpf), 'r', 'LineWidth', 1.5);
title('Phase Response of HPF');
ylabel('Angle');
xlabel('Normalized Frequency');
grid on;

% Plot magnitude response of LPF
figure;
plot(W_lpf / pi, abs(H_lpf), 'b', 'LineWidth', 1.5);
title('Magnitude Response of LPF');
ylabel('Gain (dB)');
xlabel('Normalized Frequency');
grid on;

% Plot phase response of LPF
figure;
plot(W_lpf / pi, angle(H_lpf), 'b', 'LineWidth', 1.5);
title('Phase Response of LPF');
ylabel('Angle');
xlabel('Normalized Frequency');
grid on;
