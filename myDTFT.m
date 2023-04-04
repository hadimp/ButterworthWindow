function [X, om] = myDTFT (x, N, flag)
%myDTFT     calculates DTFT at N equally spaced frequencies
%           based on input N, or N=2^v >= length(x)
%
%           returns full DTFT or positive half DTFT based on value of flag
%           (default is flag = 0)
%
%           Note that this function is intended to be used with short and
%           long signal arrays. 
%           For a short array, choose N much greater than the
%           length(x) - then "plot" rather than "stem" the return spectrum
%           X (note X will be complex-valued) - the spectrum X 
%           is intended to emulate a continuous DTFT. 
%           For longer signal arrays, choose N greater or equal to the
%           signal length, but for computational efficiency choose a power of 2. Then use
%           "plot" rather than "stem" on the returned spectrum X.
%
%           Read the function code for full understanding of its operation.
%           
%       Usage:   [X, om] = MyDTFT(x, N, flag)
%
%       Inputs
%           x : a finite-length input array, of length L (real or complex)
%           N : (integer) number of frequencies for evaluation over [-pi,pi)
%               - constraint: N >= L
%               - if N is not specified, N=2^v >= L is chosen
%               - for small signals lengths, specify N >> L
%               
%           flag : (integer) controls frequency range of the returned DTFT
%               - flag = 0, return full DTFT over [0,2*pi) 
%               - flag = 1, return full DTFT over [-pi, pi) - default
%               - flag = 2 returns half DTFT over [0,pi] on ceil(N/2) + 1
%                                                                   points
%       Returns :
%           X : array of DTFT values (usually complex-valued)
%           om : array of DT radian freqs correponding to DTFT (real)

%---------------------------------------------------------------
%    written by C. Moloney, Memorial University, 2014, rev. 2020
%    inspired by and expanded from the function [H, W] = dtft(h, N) 
%    by C.S. Burrus, J.H. McClellan, A.V. Oppenheim, T.W. Parks, 
%    R.W. Schafer, & H.W. Schussler, written for use with their book
%    "Computer-Based Exercises for Signal Processing Using MATLAB"
%    (Prentice-Hall, 1994).
%---------------------------------------------------------------

if nargin == 3
    % error checking on N 
    N = floor(N); % in case N input is not an integer
    L = length(x);  
    if ( N < L )
        error('DTFT: N must be at least the length of input signal')
        return
    end
elseif nargin == 2 % set default flag and check N
    flag = 1;
    N = floor(N); % in case N input is not an integer
    L = length(x);  
    if ( N < L )
        error('DTFT: N must be at least length of input signal')
    end
elseif nargin == 1 % set default N value 2^v > L
    flag = 1 ; % set default flag
    N = 2^ceil(log2(length(x))) ; % set default value for N
end

x = x(:);  % make x into a column vector

om = (2*pi/N) * [ 0:(N-1) ]'; % define array of N frequencies over [0,2 pi) 
midN = ceil(N/2) + 1; % find mid N value, based on Matlab array indexing from 1
if (flag == 0)
    X = fft(x,N);
elseif (flag == 1)
        om(midN:N) = om(midN:N) - 2*pi;   % flip [pi,2pi) to [-pi,0)
        om = fftshift(om);              % fftshift om array
        X = fftshift( fft( x, N ) );  %  fftshift fft array 
elseif (flag == 2)
    om = om(1:midN) ; % retain only [0,pi]
    X = fft (x,N);  % full fft
    X = X(1:midN);   % retain only fft over [0,pi]
else
    error('DTFT: incorrect flag value')
end


            
    