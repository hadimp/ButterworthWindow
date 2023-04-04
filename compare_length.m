%% Generates a table comparing the empirically and zero crossing length
% WRITTEN BY: HADI MOHAMMADPOUR
% Prepared for: DR. C.Moloney
% ENGI 9821 - DSP
% Winter 2021 - Memorial University of Newfoundland
%
%% Description
% This code will generate a table to compare the empirically estimated
% length of the windows and the length measured by finding the first zero
% crossing for different scenarios.
%%
N = [1; 2 ;3 ;4; 5];
Fc = [1; 1.5; 2.5; 0.439; 1.5];
Fs = [2048; 2048; 4096; 4096; 1024];


empirical_length = zeros(5,1);
zero_crossing_length = zeros(5,1);
Cases = length(N);
Window_specification = ['N = 1, Fc = 1.000, Fs = 2048';
               'N = 2, Fc = 1.500, Fs = 2048';
               'N = 3, Fc = 2.500, Fs = 4096';
               'N = 4, Fc = 0.439, Fs = 4096';
               'N = 5, Fc = 1.500, Fs = 1024'];

for i= 1:Cases
    empirical_length(i,1) = length(But_Window(N(i),Fc(i),Fs(i), 1));
end
for i= 2:Cases
    zero_crossing_length(i,1) = length(But_Window(N(i),Fc(i),Fs(i), 0));
end
%%
T2 = table(Window_specification, empirical_length, zero_crossing_length);