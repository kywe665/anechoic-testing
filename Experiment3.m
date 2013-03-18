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
        output=[];
        while loop_count < 100
            loop_count = loop_count + 1;

            %%%%%% Put your dsp code or function call here! %%%%%%%%%%%%%%%%%%%%
%            X = real(input_data(:,1)).^2 + imag(input_data(:,1)).^2;
            
            [S,F,T,P] = spectrogram(double(input_data(:,1)),1024,800,1024,48000);
            
            surf(T,F,10*log10(P),'edgecolor','none'); axis tight; 
            view(0,90);
            xlabel('Time (Seconds)'); ylabel('Hz');
            
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

