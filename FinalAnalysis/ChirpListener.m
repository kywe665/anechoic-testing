function y = ChirpListener(argu)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    clear all;
    close all;
    SampleRate = 48000;
    FrameSize = 24000;
    count = 1;
    final_data = [];
    
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
        P=zeros(1,512);
        alpha2 = .1;
        while loop_count < 30
            loop_count = loop_count + 1;
            final_data = [final_data; input_data];

            %%%%%% Put your dsp code or function call here! %%%%%%%%%%%%%%%%%%%%
            tic;
            fft_prep = fftshift(fft(input_data, 1024));
            toc;
            fft_to_plot = real(fft_prep).^2 + imag(fft_prep).^2;
            pos_fft=fft_to_plot(length(fft_to_plot)/2+1:length(fft_to_plot));
            
            N=1024;
            A=9.2;
            ref=N^2*A^2/(10^.222);
            dbm_fft=10*log10(pos_fft*1000/ref);
            x_axis=[0:6/128:24.000-6/128];
            P = (1-alpha2)*dbm_fft + alpha2*P;

            figure(1);
            
            plot(x_axis,P);
            
            axis([0 24 -100 5]);
            title('My Spec An');
            xlabel('Frequency(KHz)');
            ylabel('Magnitude(dBm)');
            grid on;
            
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            %step(ap, y_data); %PLAYING
            input_data = step(ar);       
            drawnow;
            count = count + 1;
        end

        % You want to make sure that you release the system resources after using
        % them and they don't get tied up.
        wavwrite(final_data,SampleRate,16,'testing');
        %save('TestData.mat', final_data);
        release(ar)
        release(ap)

    catch err 
        release(ar)
        release(ap)
        rethrow(err)
    end

    y = 0;

end