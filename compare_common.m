%% Compare a Butterworth window for given spec with commonly used windows
% WRITTEN BY: HADI MOHAMMADPOUR
% Prepared for: DR. C.Moloney
% ENGI 9821 - DSP
% Winter 2021 - Memorial University of Newfoundland
%
%% INPUTS
% N: Order of the filter used to design the window
% Fc: Cut-off frequency of the filter used to design the window
% Fs: Sampling frequency of the filter used to design the window
% emp_length: Set 1 to use the empirically estimated window lengths
% Input: the input for which the windowing methods will be compare. (Keep
% in mind that the Butterworth window length is limited and you should
% either zero pad your input, or the window, or use a portion of the input
% signal)
%%
function compare_common(N, Fc, Fs, emp_length, Input)

    butterworth = But_Window(N, Fc, Fs, emp_length);
    window_length = length(butterworth);
    
    if Input == 0
        Input = sin_input_2(window_length, Fs);
    elseif( length(Input) > window_length )
        Input = Input(1:window_length);
    elseif( length(Input) < window_length )
        Input = [Input zeros(1, (window_length - length(Input)))];
    end
    % rectangular window
    rect_win = rectwin(window_length);
    [pxx_rec,f_rec] = myDTFT(Input.*rect_win);
    figure(10)
    plot(f_rec*(Fs/(2*pi)),abs(pxx_rec*2/window_length));
    hold on


    % hanning window
    hann_window = hanning(window_length);
    [pxx_hann,f_hann] = myDTFT(Input.*hann_window);
    figure(10)
    plot(f_hann*(Fs/(2*pi)),abs(pxx_hann*2/window_length));
    hold on

    % blackman window
    bm_window = blackman(window_length);
    [pxx_bm,f_bm] = myDTFT(Input.*bm_window);
    figure(10)
    plot(f_bm*(Fs/(2*pi)),abs(pxx_bm*2/window_length));
    hold on
    xlim([0,250]);

    % butterworth window
    [pxx_but,f_but] = myDTFT(Input.*butterworth);
    figure(10)
    plot(f_but*(Fs/(2*pi)),abs(pxx_but));
    hold on
    
    % Kaiser window ( beta = 4)
    beta = 3;
    [pxx_but,f_but] = myDTFT(Input.*kaiser(window_length, beta));
    figure(10)
    plot(f_but*(Fs/(2*pi)),abs(pxx_but)*2/window_length);
    xlim([95,125]);
    legend('Rectangular Window', 'Hanning Window', 'Blackman', 'Butterworth Window', 'Kaiser beta = 3');
    hold off
    
   title({'Figure 10 - PSD estimation using common windows and the novel Butterworth window';''});
    ylabel('PSD');
    xlabel('Frequency (Hz)');
    saveas(10,'Figure 10.png');
end