%% Testing the Butterworth and Hanning window for EEG data
% WRITTEN BY: HADI MOHAMMADPOUR
% Prepared for: DR. C.Moloney
% ENGI 9821 - DSP
% Winter 2021 - Memorial University of Newfoundland
%
%% Input
% N: Order of the filter used to design the Butterworth window
% Fc: Cut-off frequency of the filter used to design the Butterworth window
% Fs: Sampling frequency of the filter used to design the Butterworth window
% emp_length: Set 1 to use the empirically estimated window lengths
%
%%
N = 4;
Fc = 0.439;
Fs = 2048;
emp_length = 0;

load('EEG')

But_Window_EEG = But_Window(N, Fc, Fs, emp_length);
window_length = length(But_Window_EEG);
hann_window = hanning(window_length);
%% F = 1:30
[pxx_EEG_hann,f_EEG_han] = myDTFT(right(3*window_length:4*window_length-1).*hann_window);
figure(50)
plot(f_EEG_han*(Fs/(2*pi)),abs(pxx_EEG_hann*2/window_length));
hold on
xlim([1,30]);

[pxx_EEG_but,f_EEG_but] = myDTFT(right(3*window_length:4*window_length-1).*But_Window_EEG);
figure(50)
plot(f_EEG_but*(Fs/(2*pi)),abs(pxx_EEG_but));
xlim([1,30]);
hold off
legend('Hanning Windowed EEG', 'Butterworth Windowed EEG (N=4, Fc=0.439, Fs=2048');
title({'Figure 11 - PSD estimation for EEG signals using Hanning window and the Butterworth window';''});
ylabel('PSD');
xlabel('Frequency (Hz)');
saveas(50,'Figure 11.png');
%% Delta (1 to 4Hz)

[pxx_EEG_hann,f_EEG_han] = myDTFT(right(3*window_length:4*window_length-1).*hann_window);
figure(51)
plot(f_EEG_han*(Fs/(2*pi)),abs(pxx_EEG_hann*2/window_length));
hold on

[pxx_EEG_but,f_EEG_but] = myDTFT(right(3*window_length:4*window_length-1).*But_Window_EEG);
figure(51)
plot(f_EEG_but*(Fs/(2*pi)),abs(pxx_EEG_but));
xlim([1,4]);
hold off
legend('Hanning Windowed EEG', 'Butterworth Windowed EEG (N=4, Fc=0.439, Fs=2048');
title({'Figure 12 - PSD estimation for EEG signals using Hanning window and the Butterworth window';''});
ylabel('PSD');
xlabel('Frequency (Hz)');
saveas(51,'Figure 12.png');

%% Theta (4 to 8Hz)
[pxx_EEG_hann,f_EEG_han] = myDTFT(right(3*window_length:4*window_length-1).*hann_window);
figure(52)
plot(f_EEG_han*(Fs/(2*pi)),abs(pxx_EEG_hann*2/window_length));
hold on

[pxx_EEG_but,f_EEG_but] = myDTFT(right(3*window_length:4*window_length-1).*But_Window_EEG);
figure(52)
plot(f_EEG_but*(Fs/(2*pi)),abs(pxx_EEG_but));
xlim([4,8]);
hold off
legend('Hanning Windowed EEG', 'Butterworth Windowed EEG (N=4, Fc=0.439, Fs=2048');
title({'Figure 13 - PSD estimation for EEG signals using Hanning window and the Butterworth window';''});
ylabel('PSD');
xlabel('Frequency (Hz)');
saveas(52,'Figure 13.png');

%% Alpha (8 to 12Hz)
[pxx_EEG_hann,f_EEG_han] = myDTFT(right(3*window_length:4*window_length-1).*hann_window);
figure(53)
plot(f_EEG_han*(Fs/(2*pi)),abs(pxx_EEG_hann*2/window_length));
hold on

[pxx_EEG_but,f_EEG_but] = myDTFT(right(3*window_length:4*window_length-1).*But_Window_EEG);
figure(53)
plot(f_EEG_but*(Fs/(2*pi)),abs(pxx_EEG_but));
xlim([8,12]);
hold off
legend('Hanning Windowed EEG', 'Butterworth Windowed EEG (N=4, Fc=0.439, Fs=2048');
title({'Figure 14 - PSD estimation for EEG signals using Hanning window and the Butterworth window';''});
ylabel('PSD');
xlabel('Frequency (Hz)');
saveas(53,'Figure 14.png');

%% Sigma (12 to 16Hz)
[pxx_EEG_hann,f_EEG_han] = myDTFT(right(3*window_length:4*window_length-1).*hann_window);
figure(54)
plot(f_EEG_han*(Fs/(2*pi)),abs(pxx_EEG_hann*2/window_length));
hold on

[pxx_EEG_but,f_EEG_but] = myDTFT(right(3*window_length:4*window_length-1).*But_Window_EEG);
figure(54)
plot(f_EEG_but*(Fs/(2*pi)),abs(pxx_EEG_but));
xlim([12,16]);
hold off
legend('Hanning Windowed EEG', 'Butterworth Windowed EEG (N=4, Fc=0.439, Fs=2048');
title({'Figure 15 - PSD estimation for EEG signals using Hanning window and the Butterworth window';''});
ylabel('PSD');
xlabel('Frequency (Hz)');
saveas(54,'Figure 15.png');
%% Beta (12 to 30Hz)
[pxx_EEG_hann,f_EEG_han] = myDTFT(right(3*window_length:4*window_length-1).*hann_window);
figure(55)
plot(f_EEG_han*(Fs/(2*pi)),abs(pxx_EEG_hann*2/window_length));
hold on

[pxx_EEG_but,f_EEG_but] = myDTFT(right(3*window_length:4*window_length-1).*But_Window_EEG);
figure(55)
plot(f_EEG_but*(Fs/(2*pi)),abs(pxx_EEG_but));
xlim([12,30]);
hold off
legend('Hanning Windowed EEG', 'Butterworth Windowed EEG (N=4, Fc=0.439, Fs=2048');
title({'Figure 16 - PSD estimation for EEG signals using Hanning window and the Butterworth window';''});
ylabel('PSD');
xlabel('Frequency (Hz)');
saveas(55,'Figure 16.png');