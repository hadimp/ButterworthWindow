%% Designs Butterworth window for an array of sampling frequencies
% WRITTEN BY: HADI MOHAMMADPOUR
% Prepared for: DR. C.Moloney
% ENGI 9821 - DSP
% Winter 2021 - Memorial University of Newfoundland
%
%% INPUTS
% N: Order of the filter used to design the window
% Fc: Cut-off frequency of the filter used to design the window
% Fs: an array of sampling frequencies used to design the window
% emp_length: Set 1 to use the empirically estimated window lengths
%
%%
function Change_Fs(N, Fc, Fs)    
    cases = length(Fs);
    emp_length = 1;
    
    for i = 1:cases
        win = But_Window(N, Fc, Fs(i), emp_length);
        win_length = length(win);
        L = 2^ceil(log2(win_length))*1024;
        [pxx_case_1,f_case_1] = myDTFT(sin_input_2(win_length, Fs(i)).*win, L);
        figure(9)
        plot(f_case_1*(Fs(i)/(2*pi)),abs(pxx_case_1));
        hold on
        xlim([0,140]);
        legendInfo{i} = ['Fs = ' num2str(Fs(i))];
    end
    hold off
    legend(legendInfo);
    title({'Figure 9 - PSD using various sampling frequencies for Butterworth window';''});
    ylabel('PSD');
    xlabel('Frequency (Hz)');
    saveas(9,'Figure 9.png');
end