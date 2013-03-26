%spectrum analyzer
close all;
clear all;

Tfinal = 10;
Fs = 48000;
t = 0:1/Fs:Tfinal;      % 10 seconds @ 1kHz sample rate
fo = 1; f1 = 1000;   % Start at 10Hz, go up to 400Hz
X = chirp(t,fo,Tfinal,f1,'linear');
[X Fs nbits] = wavread('testing.wav');
X = X(:,1);

[t x] = prepForPlot(X, Fs, 1500);
figure(1);
plot(t, x);
wavwrite(X,1/Fs,16,'testChirp1_10');
sound(X,48000)
title('My Spec An');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
grid on;