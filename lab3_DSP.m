clc; 
clear all; 
close all; 
  
numerator = [1]; 
denominator = [1 2 1]; 
sys = tf(numerator, denominator); 
 
syms s; 
H_s = poly2sym(numerator, s) / poly2sym(denominator, s); 
impulse_response = ilaplace(H_s); 
t = 0:0.1:10; 
impulse_response_numeric = double(subs(impulse_response, t));

stem(t, impulse_response_numeric); 
title('Impulse Response'); 
xlabel('Time (seconds)'); 
ylabel('Amplitude'); 