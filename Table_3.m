%% Generates a version of Table 3 in the first reference paper
% WRITTEN BY: HADI MOHAMMADPOUR
% Prepared for: DR. C.Moloney
% ENGI 9821 - DSP
% Winter 2021 - Memorial University of Newfoundland
%
%%
N = [0; 0; 0; 0; 0; 2; 3; 4; 4; 4; 4];
Fc = [0; 0; 0; 0; 0; 0.439; 0.439; 0.439; 0.439; 1.500; 2.500];
Fs = 2048;
Tolerance = 0.001;
emp_length = 0;



Cases = length(N);
Window_type = ['Rectangular  '; 'Hanning      '; 'Kaiser beta=2'; 'Kaiser beta=4'; 'Blackman     '; 'Butterworth  '; 'Butterworth  '; 'Butterworth  '; 'Butterworth  '; 'Butterworth  '; 'Butterworth  '];

bandwidth = zeros(Cases, 1);
sidelobe_attenuation = zeros(Cases, 1);
window_length = zeros(Cases,1);

bandwidth(1,1) = BW(rectwin(2140), 2048, 0.5);
sidelobe_attenuation(1,1) = sidelobe_att(rectwin(2140));
window_length(1,1) = 2140;

bandwidth(2,1) = BW(hanning(2140), 2048, 0.1);
sidelobe_attenuation(2,1) = sidelobe_att(hanning(2140));
window_length(2,1) = 2140;

bandwidth(3,1) = BW(kaiser(2140, 2), 2048, 0.5);
sidelobe_attenuation(3,1) = sidelobe_att(kaiser(2140, 2));
window_length(3,1) = 2140;

bandwidth(4,1) = BW(kaiser(2140, 4), 2048, 0.5);
sidelobe_attenuation(4,1) = sidelobe_att(kaiser(2140, 4));
window_length(4,1) = 2140;

bandwidth(5,1) = BW(blackman(2140), 2048, 0.5);
sidelobe_attenuation(5,1) = sidelobe_att(blackman(2140));
window_length(5,1) = 2140;

for i= 6:Cases
    sidelobe_attenuation(i,1) = sidelobe_att(But_Window(N(i), Fc(i), Fs, emp_length));
    bandwidth(i,1) = BW(But_Window(N(i), Fc(i), Fs, emp_length), Fs, Tolerance);
    window_length(i,1) = length(But_Window(N(i), Fc(i), Fs, emp_length));
end

T = table(Window_type, N, Fc, bandwidth, sidelobe_attenuation, window_length);