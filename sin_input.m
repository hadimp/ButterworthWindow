%% Generates the first sinusoidal input
function sin_input = sin_input(length, Fs)    
    
    sin_input = zeros(length,1);

    for n = 1:length
        sin_input(n) = 0.84*cos(104*pi*n/Fs)+0.8*cos(131*pi*n/Fs)+0.3*cos(170*pi*n/Fs)+1.1*cos(210*pi*n/Fs)+0.35*cos(280*pi*n/Fs)+0.98*cos(318*pi*n/Fs)+0.6*cos(348*pi*n/Fs)+0.8*cos(380*pi*n/Fs)+cos(410*pi*n/Fs);
    end
    
end