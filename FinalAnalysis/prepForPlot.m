function [ t, x ] = prepForPlot( signal, Fs, freqMax )
%prepForPlot( Signal, Sample-Frequency, Max Frequency to graph )
%returns the real part of FFT and a linspace vector ready to
    if( strcmp(freqMax,'full') )
        partial = 1;
    else
        partial = freqMax*2/Fs;
    end

    fft_prep = fftshift(fft(signal));
    fft_mag = abs(fft_prep);
    pos_fft = fft_mag(ceil(length(fft_mag)/2)+1:length(fft_mag));
    db_fft = 20*log10(pos_fft);
    x = db_fft(1:length(db_fft)*partial);
    
    t = linspace(0, Fs/2*partial, length(db_fft)*partial);
end

