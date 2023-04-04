# Butterworth Window
A counter-intuitive approach. Using a butterworth filter to develop a butterworth window. Implemented and evaluated a novel windowing method (in comparison to conventional windowing methods such as Hanning, Hamming, and Kaiser). This window was designed based on the Butterworth filter for power spectral density estimation of digital signals.

The two critical elements in evaluating any window function are the 3-dB bandwidth and the sidelobe attenuation. In commonly used window functions such as Hanning and Hamming, we have no control over 3-dB bandwidth and sidelobe attenuation for a given window length. On the other hand, we can reduce the window bandwidth for other window functions like Kaiser, Gaussian, and Chebyshev and improve the spectral resolution. However, it will reduce the sidelobe attenuation, and will not avoid undesired spectral leakages. Based on the mentioned trade-off, it is also possible to increase the sidelobe attenuation at the expense of wider 3-dB bandwidth.

This project aims to develop a windowing method based on the Butterworth filter, as discussed in “A Flexible Window Function for Spectral Analysis” paper by Tae Hyun Yoon and Eon Kyeong Joo. The paper claims that this window will give us control over both the 3-dB bandwidth and the sidelobe attenuation, respectively. As a result, it will take care of the existing trade-off. In this study, I will try to examine whether this method can solve the discussed trade-off issue in spectral analysis of windows or not.




Reference: 

T. H. Yoon and E. K. Joo, "A Flexible Window Function for Spectral Analysis [DSP Tips & Tricks]," in IEEE Signal Processing Magazine, vol. 27, no. 2, pp. 139-142, March 2010, doi: 10.1109/MSP.2009.935422.

