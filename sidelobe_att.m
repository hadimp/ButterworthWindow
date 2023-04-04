%% Estimates the sidelobe attenuation of a window
% WRITTEN BY: HADI MOHAMMADPOUR
% Prepared for: DR. C.Moloney
% ENGI 9821 - DSP
% Winter 2021 - Memorial University of Newfoundland
%
%% INPUTS
% Window: the desired window for sidelobe atteunation estimation
%
%%
function sidelobe_att = sidelobe_att(Window)    

    l_w = length(Window);
    L = 2^ceil(log2(l_w))*256;
    
    [W, ~] = myDTFT(Window, L);
    D = abs(diff(W));
    W = mag2db(abs(W));
    [Max, i] = max(W);
    
    [~, locs] = findpeaks(D(i:end));
    first_sl = W(i + locs(1));
    
    sidelobe_att = Max - first_sl;
end