%% Designs Butterworth window for an array of cut-off frequencies
% WRITTEN BY: HADI MOHAMMADPOUR
% Prepared for: DR. C.Moloney
% ENGI 9821 - DSP
% Winter 2021 - Memorial University of Newfoundland
%
%% INPUTS
% N: Order of the filter used to design the window
% Fc: An array of Cut-off frequencies used to design the window
% Fs: Sampling frequency of the filter used to design the window
%
%%
function Change_Fc(N, Fc, Fs)    
    cases = length(Fc);
    emp_length = 1;
    
    for i = 1:cases
        win = But_Window(N, Fc(i), Fs, emp_length);
        win_length = length(win);
        L = 2^ceil(log2(win_length))*1024;
        [pxx_case_1,f_case_1] = myDTFT(sin_input_2(win_length, Fs).*win, L);
        figure(8)
        plot(f_case_1*(Fs/(2*pi)),abs(pxx_case_1));
        hold on
        xlim([80,140]);
        legendInfo{i} = ['Fc = ' num2str(Fc(i))];
    end
    hold off
    legend(legendInfo);
    title({'Figure 8 - PSD using various cut off frequencies for Butterworth window';''});
    ylabel('PSD');
    xlabel('Frequency (Hz)');
    saveas(8,'Figure 8.png');
end