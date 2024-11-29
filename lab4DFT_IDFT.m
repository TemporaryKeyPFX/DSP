close all; 
 
% Define the input signal 
x = input('Enter the input x = '); 
 
% Length of the input signal 
N = length(x); 
 
% Time indices 
n = 0:N-1; 
 
% Frequency indices 
k = 0:N-1; 
 
% Compute DFT manually 
% DFT matrix 
W = exp(-1i * 2 * pi * (n' * k) / N); 
% DFT calculation 
Xk = x * W; 
 
% Display DFT results 
disp('N point DFT:'); 
disp(Xk); 
 
% Magnitude and Phase of DFT 
mag = abs(Xk); 
phase = angle(Xk); 
 
% Plotting the results 
subplot(2, 2, 1); 
plot(n, x, '-o'); 
title('Input Signal x(n)'); 
xlabel('Sample Index n'); 
ylabel('x(n)'); 
 
subplot(2, 2, 2); 
plot(k, mag, '-o'); 
title('Magnitude of X(k)'); 
xlabel('Frequency Index k'); 
ylabel('|X(k)|'); 
 
subplot(2, 2, 3); 
plot(k, phase, '-o'); 
title('Phase of X(k)'); 
xlabel('Frequency Index k'); 
ylabel('Phase of X(k)'); 
 
% Compute IDFT manually 
% IDFT matrix 
W1 = exp(1i * 2 * pi * (n' * k) / N); 
% IDFT calculation 
x2 = (1 / N) * (Xk * W1); 
 
% Display IDFT results 
disp('IDFT of X(k):'); 
disp(x2); 
 
% Plotting the IDFT result 
subplot(2, 2, 4); 
plot(n, x2, '-o'); 
title('Reconstructed Signal x2(n)'); 
xlabel('Sample Index n'); 
ylabel('x2(n)'); 
 
% Verification using MATLAB's FFT function 
Xk1 = fft(x); 
disp('Verification by FFT function:'); 
disp(Xk1); 
 
% Plotting FFT results for comparison 
figure; 
subplot(2, 1, 1); 
plot(k, abs(Xk1), '-o'); 
title('Magnitude of X(k) using FFT'); 
xlabel('Frequency Index k'); 
ylabel('|X(k)|'); 
 
subplot(2, 1, 2); 
plot(k, angle(Xk1), '-o'); 
title('Phase of X(k) using FFT'); 
xlabel('Frequency Index k'); 
ylabel('Phase of X(k)');