%% Designs a Butterworth window for a given specification
% WRITTEN BY: HADI MOHAMMADPOUR
% Prepared for: DR. C.Moloney
% ENGI 9821 - DSP
% Winter 2021 - Memorial University of Newfoundland
%
% This code aims to develop a windowing method based on
% butterworth filter, as discussed in �A Flexible Window Function for 
% Spectral Analysis� paper by Tae Hyun Yoon and Eon Kyeong Joo.
%
%% INPUTS
% N: Order of the filter used to design the window
% Fc: Cut-off frequency of the filter used to design the window
% Fs: Sampling frequency of the filter used to design the window
% emp_length: Set 1 to use the empirically estimated window lengths
%
%%
function Butterworth_window = But_Window(N, Fc, Fs, emp_length)    

    % Implementing a Butterworth filter
    [b,a] = butter(N, Fc/(Fs/2));     
    f = linspace(-15, 15, 300);     
    figure(1)
    freqz(b,a,f, Fs); 
    hold on
    
    % Calculating the impulse response of the Butterworth filter
    impulse_response = impz(b, a);
    l_ir = length(impulse_response);
    
    % Determine the window length empirically
    if(emp_length)
        if(N == 1)
            window_len = floor(0.66*Fs/Fc);
        elseif(N == 2)
            window_len = floor(0.705*Fs/Fc);
        elseif(N == 3)
            window_len = floor(0.784*Fs/Fc);
        elseif(N == 4)
            window_len = floor(0.890*Fs/Fc);
        elseif(N == 5)
            window_len = floor(1.005*Fs/Fc);
        end
        
% Determine the window length by zero crossings
    else
        zero_crossings = @(v) find(v(:).*circshift(v(:), [-1 0]) <= 0);
        zero = zero_crossings(impulse_response);

        % Choose first zero crossing as the length of the window
        window_len = zero(1);
    end
    [Max, ~] = max(impulse_response);
    Butterworth_window = impulse_response(1:window_len);
    
    n = linspace(1, l_ir, l_ir);
    figure(2)
    plot(n, impulse_response/Max);
    hold on
    plot(n(1:window_len),Butterworth_window/Max, 'color', 'r');
    ylim([-0.2,1.2]);
    hold off
    legend('Butterworth filter', 'Butterworth window');
    title({'Figure 1 - Impulse Response of Butterworth filter & Butterworth window';''});
    xlabel('k');
    ylabel('h(k)');
    % Plotting the frequency response of the created filter
    [Window, om] = myDTFT(Butterworth_window, Fs*20);
    Window = mag2db(abs(Window));
    figure(1)
    plot(om*(Fs/(2*pi)),Window, 'color', 'r');
    xlim([-15,15]);
    hold off
    legend('Butterworth filter', 'Butterworth window');
    title({'Figure 2 - Frequency Response of Butterworth filter & Butterworth window';''});
    
    saveas(1,'Figure 1.png')
    saveas(2,'Figure 2.png')
end