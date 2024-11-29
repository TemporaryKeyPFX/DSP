 
% Define two sequences x and h 
x = [1,3,2];    % First sequence 
h = [3,2,1];    % Second sequence 
% Compute the length of the result of linear convolution 
N = length(x) + length(h) - 1; 
% Compute FFT of both sequences with zero-padding to length N 
X = fft(x, N); 
H = fft(h, N); 
% Multiply the FFTs to get the frequency domain representation of the convolution 
Y = X .* H; 
% Compute the inverse FFT to get the linear convolution result 
y = ifft(Y); 
% Display the linear convolution result 
disp('Linear Convolution using FFT:'); 
disp(y); 
% Plot the sequences and their linear convolution 
subplot(3,1,1); 
stem(0:length(x)-1, x, 'filled'); 
title('Sequence x[n]'); 
xlabel('n'); 
ylabel('Amplitude'); 
subplot(3,1,2); 
stem(0:length(h)-1, h, 'filled'); 
title('Sequence h[n]'); 
xlabel('n'); 
ylabel('Amplitude'); 
subplot(3,1,3); 
stem(0:N-1, real(y), 'filled'); % Take only real part in case of any numerical error 
title('Linear Convolution of x[n] and h[n] using FFT'); 
xlabel('n'); 
ylabel('Amplitude');