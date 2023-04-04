%% Calculates the 3-dB bandwidth of a window
% WRITTEN BY: HADI MOHAMMADPOUR
% Prepared for: DR. C.Moloney
% ENGI 9821 - DSP
% Winter 2021 - Memorial University of Newfoundland
%
%% INPUTS
% Window: the desired window for 3-dB bandwidth estimation
% Fs: Sampling frequency
% Tolerance: the tolerance for the approximation of the 3-dB frequency
%   for a Butterworth window set : 0.01 (or 0.1 if fails to run)
%   for a commonly used window(e.g. Hanning, Kaiser, etc. set: 0.5
%
%%
function BW = BW(Window, Fs, Tolerance) 

    l_w = length(Window);
    L = 2^ceil(log2(l_w))*1024;
    
    [W, ~] = myDTFT(Window, L);
     W = abs(W);
    
    % Find the maximum value of the window
    [Max, i] = max(W);
    f_max = (((2*i)/L) - 1) * Fs/2;
    
    % Find the 3-dB frequency of the window
    freqs = find( abs(W - (Max/sqrt(2))) <= Tolerance );
    freq = freqs(freqs > i);
    
    freq_3dB = (((2*freq(1))/L) - 1) * Fs/2;
    BW = 2*abs(freq_3dB - f_max);
end