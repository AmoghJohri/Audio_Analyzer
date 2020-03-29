# Audio_Analyzer (Course Project)
The recorded speech has been saved as “Input_clip.wav”. 

The Sampling frequency for the signal comes out to be 8000Hz(which gets printed on the command-line when the program is executed).

However, for the present scenario I have also utilized a clip downloaded from youtube (“Input_clip_2.wav” - unable to attach - https://www.youtube.com/watch?v=fSfc21RDkbw) which is a sound ranging from 70Hz to 20kHz, which gives us a true sense of how the Low-Pass filter, the High-Pass filter and the reconstruction works.

The sampling frequency for this signal comes out to be 44100Hz (which gets printed on the command-line when the program is executed).
This clip can be executed by using 256 instead of 6.125 as the time duration.

We apply Discrete Fourier Transform (DFT) because:
	1) The input signal is discrete.
	2) The input signal is bounded.
	3) The frequency domain signal comes out to be discrete.

Fig1 – Compares the Input signal against the signal reconstructed through the low-pass filter.
Fig2 – Plots the impulse response of the Low-pass filter
Fig3 – Compares the Input signal against the signal reconstructed through the high-pass filter.
Fig4 – Plots the impulse response of the High-pass filter
Fig5 – Compares the signal reconstructed through the low-pass filter against the signal reconstructed through the high-pass filter
Fig6 – Plots the low-pass filter in the frequency domain
Fig7 – Plots the high-pass filter in the frequency domain
