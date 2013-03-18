function y = specan(argu)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    clear all;
    close all;
    SampleRate = 48000;
    FrameSize = 24000;
    
    try % VERY IMPORTANT

        % This sets up the characteristics of playback
        ap = dsp.AudioPlayer;
        set(ap, 'SampleRate', SampleRate);
        set(ap, 'BufferSizeSource', 'Property');
        set(ap, 'BufferSize', FrameSize);
        set(ap, 'QueueDuration', 0.3);

        % This sets up the characteristics of recording
        ar = dsp.AudioRecorder;
        set(ar, 'DeviceDataType', '16-bit integer');
        set(ar, 'SamplesPerFrame', FrameSize);
        set(ar, 'SampleRate', SampleRate);

        % This records the first set of data
        disp('Starting processing');
        input_data = step(ar); % This gets the first block of data from the sound card.
        loop_count = 0;
        while loop_count < 100
            loop_count = loop_count + 1;

            %%%%%% Put your dsp code or function call here! %%%%%%%%%%%%%%%%%%%%
            tic;
            fft_prep = fftshift(fft(input_data, 1024));
            toc;
            fft_to_plot = real(fft_prep).^2 + imag(fft_prep).^2;
            pos_fft=fft_to_plot(length(fft_to_plot)/2+1:length(fft_to_plot));
            
%              [X, N] = linspace();
            N=1024;
            A=.9876;
            ref=N^2*A^2/(10^.222);
            dbm_fft=10*log10(pos_fft*1000/ref);
            x_axis=[0:6/128:24.000-6/128];
%             x_axis=[0:2:48000-2];
            figure(1);
            plot(x_axis,dbm_fft);
            
            axis([0 24 -100 5]);
            title('My Spec An');
            xlabel('Frequency(KHz)');
            ylabel('Magnitude(dBm)');
            grid on;
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %step(ap, y_data); %PLAYING
            input_data = step(ar);       
            drawnow;
        end

        % You want to make sure that you release the system resources after using
        % them and they don't get tied up.
        release(ar)
        release(ap)

    catch err 
        release(ar)
        release(ap)
        rethrow(err)
    end

    y = 0;

end

