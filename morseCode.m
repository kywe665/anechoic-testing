[X Fs nbits] = wavread ('mix10.wav');
T = 0:0.001:2;
%X = chirp(T,100,1,200,'q');

fft_prep = fftshift(fft(X));

fft_to_plot = real(fft_prep).^2 + imag(fft_prep).^2;
pos_fft=fft_to_plot(1:length(fft_to_plot)/2);

N=1024;
A=.9876;
ref=N^2*A^2/(10^.222);
dbm_fft=10*log10(pos_fft*1000/ref);
x_axis=[0:1/64:8.000-1/64];
%             x_axis=[0:2:48000-2];
figure(1);
plot(x_axis,dbm_fft);

axis([0 8 -100 5]);
title('My Spec An');
xlabel('Frequency(KHz)');
ylabel('Magnitude(dBm)');
grid on;

% figure(2);
% 
% second = fftshift(fft_to_plot);
% dbm_fft=10*log10(second*1000/ref);
% plot(dbm_fft);
% 
% axis([0 8 -100 5]);
% title('My Spec An');
% xlabel('Frequency(KHz)');
% ylabel('Magnitude(dBm)');
% grid on;