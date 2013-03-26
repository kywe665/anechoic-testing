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
%%%%%%%%%%%%
% From the back
%%%%%%%%%%%%
%%%%%%% Low
if ~exist('ThinBackLow', 'var')
    [ThinBackLow Fs nbits] = wavread('1backLow.wav');
    ThinBackLow = ThinBackLow(:,1);
end
if ~exist('MediumBackLow', 'var')
    [MediumBackLow Fs nbits] = wavread('2backLow.wav');
    MediumBackLow = MediumBackLow(:,1);
end
if ~exist('ThickBackLow', 'var')
    [ThickBackLow Fs nbits] = wavread('3backLow.wav');
    ThickBackLow = ThickBackLow(:,1);
end
%%%%%%% Full
if ~exist('ThinBackFull', 'var')
    [ThinBackFull Fs nbits] = wavread('1backFull.wav');
    ThinBackFull = ThinBackFull(:,1);
end
if ~exist('MediumBackFull', 'var')
    [MediumBackFull Fs nbits] = wavread('2backFull.wav');
    MediumBackFull = MediumBackFull(:,1);
end
if ~exist('ThickBackFull', 'var')
    [ThickBackFull Fs nbits] = wavread('3backFull.wav');
    ThickBackFull = ThickBackFull(:,1);
end
%%%%%%%%%%%%
% From the side
%%%%%%%%%%%%
%%%%%%% Low
if ~exist('ThinSideLow', 'var')
    [ThinSideLow Fs nbits] = wavread('1sideLow.wav');
    ThinSideLow = ThinSideLow(:,1);
end
if ~exist('MediumSideLow', 'var')
    [MediumSideLow Fs nbits] = wavread('2sideLow.wav');
    MediumSideLow = MediumSideLow(:,1);
end
if ~exist('ThickSideLow', 'var')
    [ThickSideLow Fs nbits] = wavread('3sideLow.wav');
    ThickSideLow = ThickSideLow(:,1);
end
%%%%%%% Full
if ~exist('ThinSideFull', 'var')
    [ThinSideFull Fs nbits] = wavread('1sideFull.wav');
    ThinSideFull = ThinSideFull(:,1);
end
if ~exist('MediumSideFull', 'var')
    [MediumSideFull Fs nbits] = wavread('2sideFull.wav');
    MediumSideFull = MediumSideFull(:,1);
end
if ~exist('ThickSideFull', 'var')
    [ThickSideFull Fs nbits] = wavread('3sideFull.wav');
    ThickSideFull = ThickSideFull(:,1);
end



%%%%%%%%%%%%%%%%%%%%%%
% Get x and y to plot
%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% Low
[t_thinCenterLow x_thinCenterLow] = prepForPlot(ThinCenterLow, Fs, 250, 50);
[t_mediumCenterLow x_mediumCenterLow] = prepForPlot(MediumCenterLow, Fs, 250, 50);
[t_thickCenterLow x_thickCenterLow] = prepForPlot(ThickCenterLow, Fs, 250, 50);
%%%%%%% Full
[t_thinCenterFull x_thinCenterFull] = prepForPlot(ThinCenterFull, Fs, 'full', 100);
[t_mediumCenterFull x_mediumCenterFull] = prepForPlot(MediumCenterFull, Fs, 'full', 100);
[t_thickCenterFull x_thickCenterFull] = prepForPlot(ThickCenterFull, Fs, 'full', 100);
%%%%%%%%%%
% From the Back
%%%%%%%%%%
%%%%%%% Low
[t_thinBackLow x_thinBackLow] = prepForPlot(ThinBackLow, Fs, 250, 50);
[t_mediumBackLow x_mediumBackLow] = prepForPlot(MediumBackLow, Fs, 250, 50);
[t_thickBackLow x_thickBackLow] = prepForPlot(ThickBackLow, Fs, 250, 50);
%%%%%%% Full
[t_thinBackFull x_thinBackFull] = prepForPlot(ThinBackFull, Fs, 'full', 100);
[t_mediumBackFull x_mediumBackFull] = prepForPlot(MediumBackFull, Fs, 'full', 100);
[t_thickBackFull x_thickBackFull] = prepForPlot(ThickBackFull, Fs, 'full', 100);
%%%%%%%%%%
% From the Side
%%%%%%%%%%
%%%%%%% Low
[t_thinSideLow x_thinSideLow] = prepForPlot(ThinSideLow, Fs, 250, 50);
[t_mediumSideLow x_mediumSideLow] = prepForPlot(MediumSideLow, Fs, 250, 50);
[t_thickSideLow x_thickSideLow] = prepForPlot(ThickSideLow, Fs, 250, 50);
%%%%%%% Full
[t_thinSideFull x_thinSideFull] = prepForPlot(ThinSideFull, Fs, 'full', 100);
[t_mediumSideFull x_mediumSideFull] = prepForPlot(MediumSideFull, Fs, 'full', 100);
[t_thickSideFull x_thickSideFull] = prepForPlot(ThickSideFull, Fs, 'full', 100);

%%%%%%%%%%%%%%%%%%%%%%
% Plot the figures
%%%%%%%%%%%%%%%%%%%%%%
figure(1);
plot(t_thinCenterLow, x_thinCenterLow, t_mediumCenterLow, x_mediumCenterLow, t_thickCenterLow, x_thickCenterLow);
title('Center Low: Thin-blue, Med-green, Thick-red');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
grid on;
figure(2);
plot(t_thinCenterFull, x_thinCenterFull, t_mediumCenterFull, x_mediumCenterFull, t_thickCenterFull, x_thickCenterFull);
title('Center Full: Thin-blue, Med-green, Thick-red');
xlabel('Frequency(kHz)');
ylabel('Magnitude(dB)');
grid on;
%%%%%%%%%
% From the back
%%%%%%%%%
figure(3);
plot(t_thinBackLow, x_thinBackLow, t_mediumBackLow, x_mediumBackLow, t_thickBackLow, x_thickBackLow);
title('Back Low: Thin-blue, Med-green, Thick-red');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
grid on;
figure(4);
plot(t_thinBackFull, x_thinBackFull, t_mediumBackFull, x_mediumBackFull, t_thickBackFull, x_thickBackFull);
title('Back Full: Thin-blue, Med-green, Thick-red');
xlabel('Frequency(kHz)');
ylabel('Magnitude(dB)');
grid on;
%%%%%%%%%
% From the side
%%%%%%%%%
figure(5);
plot(t_thinSideLow, x_thinSideLow, t_mediumSideLow, x_mediumSideLow, t_thickSideLow, x_thickSideLow);
title('Side Low: Thin-blue, Med-green, Thick-red');
xlabel('Frequency(Hz)');
ylabel('Magnitude(dB)');
grid on;
figure(6);
plot(t_thinSideFull, x_thinSideFull, t_mediumSideFull, x_mediumSideFull, t_thickSideFull, x_thickSideFull);
title('Side Full: Thin-blue, Med-green, Thick-red');
xlabel('Frequency(kHz)');
ylabel('Magnitude(dB)');
grid on;