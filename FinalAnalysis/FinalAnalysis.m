%%%%%%%%%%%%%%%%%%%%
% Analysis
%%%%%%%%%%%%%%%%%%%%
Fs = 48000; %MAKE SURE THE .WAV GIVES YOU THIS

%%%%%%%%%%%%%%%%%%%%%%
% Read in the data if it is not there.
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Low
if ~exist('ThinCenterLow', 'var')
    [ThinCenterLow Fs nbits] = wavread('1centerLow.wav');
    ThinCenterLow = ThinCenterLow(:,1);
end
if ~exist('MediumCenterLow', 'var')
    [MediumCenterLow Fs nbits] = wavread('2centerLow.wav');
    MediumCenterLow = MediumCenterLow(:,1);
end
if ~exist('ThickCenterLow', 'var')
    [ThickCenterLow Fs nbits] = wavread('3centerLow.wav');
    ThickCenterLow = ThickCenterLow(:,1);
end
%%%%%%% Full
if ~exist('ThinCenterFull', 'var')
    [ThinCenterFull Fs nbits] = wavread('1centerFull.wav');
    ThinCenterFull = ThinCenterFull(:,1);
end
if ~exist('MediumCenterFull', 'var')
    [MediumCenterFull Fs nbits] = wavread('2centerFull.wav');
    MediumCenterFull = MediumCenterFull(:,1);
end
if ~exist('ThickCenterFull', 'var')
    [ThickCenterFull Fs nbits] = wavread('3centerFull.wav');
    ThickCenterFull = ThickCenterFull(:,1);
end

%%%%%%%%%%%%%%%%%%%%%%
% Get x and y to plot
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Low
[t_thinCenterLow x_thinCenterLow] = prepForPlot(ThinCenterLow, Fs, 250);
[t_mediumCenterLow x_mediumCenterLow] = prepForPlot(MediumCenterLow, Fs, 250);
[t_thickCenterLow x_thickCenterLow] = prepForPlot(ThickCenterLow, Fs, 250);

%%%%%%% Full
[t_thinCenterFull x_thinCenterFull] = prepForPlot(ThinCenterFull, Fs, 'full');
[t_mediumCenterFull x_mediumCenterFull] = prepForPlot(MediumCenterFull, Fs, 'full');
[t_thickCenterFull x_thickCenterFull] = prepForPlot(ThickCenterFull, Fs, 'full');

%%%%%%%%%%%%%%%%%%%%%%
% Plot the figures
%%%%%%%%%%%%%%%%%%%%%%
figure(1);
plot(t_thinCenterLow, x_thinCenterLow, t_mediumCenterLow, x_mediumCenterLow, t_thickCenterLow, x_thickCenterLow);
title('Low: Thin-blue, Med-green, Thick-red');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
grid on;
figure(2);
plot(t_thinCenterFull, x_thinCenterFull, t_mediumCenterFull, x_mediumCenterFull, t_thickCenterFull, x_thickCenterFull);
title('Full: Thin-blue, Med-green, Thick-red');
xlabel('Frequency(kHz)');
ylabel('Magnitude(dB)');
grid on;