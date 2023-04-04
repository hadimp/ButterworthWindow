%% Designs Butterworth window for an array of cut-off orders
% WRITTEN BY: HADI MOHAMMADPOUR
% Prepared for: DR. C.Moloney
% ENGI 9821 - DSP
% Winter 2021 - Memorial University of Newfoundland
%
%% INPUTS
% N: an arrray of orders used to design the window
% Fc: Cut-off frequency of the filter used to design the window
% Fs: Sampling frequency of the filter used to design the window
% emp_length: Set 1 to use the empirically estimated window lengths
%
%%
function Change_Order(N, Fc, Fs)    
    cases = length(N);
    emp_length = 1;
    
    for i = 1:cases
        win = But_Window(N(i), Fc, Fs, emp_length);
        win_length = length(win);
        L = 2^ceil(log2(win_length))*1024;
        [pxx_case_1,f_case_1] = myDTFT(sin_input(win_length, Fs).*win, L);
        figure(7)
        plot(f_case_1*(Fs/(2*pi)),abs(pxx_case_1));
        hold on
        xlim([80,140]);
        legendInfo{i} = ['N = ' num2str(N(i))];
    end
    hold off
    legend(legendInfo);
    title({'Figure 7 - PSD using various orders of Butterworth window';''});
    ylabel('PSD');
    xlabel('Frequency (Hz)');
    saveas(7,'Figure 7.png');
end