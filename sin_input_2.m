%% Generates the seond sinusoidal input
function sin_input_2 = sin_input_2(length, Fs)    
    
    sin_input_2 = zeros(length,1);

    for n = 1:length
        sin_input_2(n) = 1.1*cos(210*pi*n/Fs)+0.75*cos(220*pi*n/Fs)+0.9*cos(238*pi*n/Fs);
    end
    
end