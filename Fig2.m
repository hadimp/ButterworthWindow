%% Generates a version of Figure 2 in the first reference paper
% WRITTEN BY: HADI MOHAMMADPOUR
% Prepared for: DR. C.Moloney
% ENGI 9821 - DSP
% Winter 2021 - Memorial University of Newfoundland
%
%%
% N=3, Fc=1.25
N = 3;
Fc = 1.25;
But_Window_1 = But_Window(N, Fc, Fs, emp_length);
window_length_1 = length(But_Window_1);
[pxx_but_1,f_but_1] = myDTFT(sin_input(window_length_1, Fs).*But_Window_1, window_length_1);
figure(6)
plot(f_but_1*(Fs/(2*pi)),abs(pxx_but_1));
xlim([0,250]);
hold on



% N=3, Fc=0.75
N = 3;
Fc = 0.75;
But_Window_2 = But_Window(N, Fc, Fs, emp_length);
window_length_2 = length(But_Window_2);
[pxx_but_2,f_but_2] = myDTFT(sin_input(window_length_2, Fs).*But_Window_2);
figure(6)
plot(f_but_2*(Fs/(2*pi)),abs(pxx_but_2));
xlim([0,250]);
hold on



% N=5, Fc=0.5
N = 5;
Fc = 0.5;
But_Window_3 = But_Window(N, Fc, Fs, emp_length);
window_length_3 = length(But_Window_3);
[pxx_but_3,f_but_3] = myDTFT(sin_input(window_length_3, Fs).*But_Window_3);
figure(6)
plot(f_but_3*(Fs/(2*pi)),abs(pxx_but_3));
xlim([0,250]);
hold off
legend('Butterworth Window 1 (N=3, Fc=1.25)', 'Butterworth Window 2 (N=3, Fc=0.75)', 'Butterworth Window 3 (N=5, Fc=0.5)');
title({'Figure 6 - PSD using various Butterworth windows';''});
ylabel('PSD');
xlabel('Frequency (Hz)');
ax = gca;
ax.XTick = 0:10:250;
saveas(6,'Figure 6.png')