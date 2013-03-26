%spectrum analyzer
close all;
clear all;

Tfinal = 20;
Fs = 48000;
t = 0:1/Fs:Tfinal;      % 10 seconds @ 1kHz sample rate
fo = 1; f1 = 200;   % Start at 10Hz, go up to 400Hz
X = chirp(t,fo,Tfinal,f1,'linear');

[X Fs nbits] = wavread('1centerLow.wav');
X = X(:,1);

fft_prep = fftshift(fft(X));
fft_mag = abs(fft_prep);%real(fft_prep).^2 + imag(fft_prep).^2;
pos_fft = fft_mag(ceil(length(fft_mag)/2)+1:length(fft_mag));
db_fft=20*log10(pos_fft);
figure(1);
semilogx(linspace(0, Fs/2, length(db_fft)), db_fft);
wavwrite(X,1/Fs,16,'finallyDidIt');
sound(X,48000)
title('My Spec An');
xlabel('Frequency(KHz)');
ylabel('Magnitude(dB)');
grid on;