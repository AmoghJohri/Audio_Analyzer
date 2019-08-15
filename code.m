#This is the recorderd audio-file, the input signal has been denoted by y and fs denotes its sampling frequency
[y, fs] = audioread("Input_clip.wav");
%t = linspace(0, length(y)/fs, length(y)); Found out to be = 6.125seconds;
cut_off_freq = 4000;

#fs denotes the sampling frequency of the signal
printf("The Sampling Frequency of the Input Signal is: %dHz\n", fs);

#Here, we take the Discrete Fourier Transform (DFT) of the input signal as the input is received as a discrete non-periodic and bounded signal.
y_freq = fft(y); #y_freq represents the signal y in the frequency domain

#now we need to apply a low-pass filter upto 4kHz(4000Hz), in order to do this, we basically form an array of length same as that of the input signal in the frequency domain, with all its discrete values = 1 from 1 to 4000*6.125 and 0 thereafter. 
low_pass_filter = [ones(cut_off_freq*6.125,1)]; #putting 1s from 1 to 4000*6.125th position of the array
low_pass_filter = [low_pass_filter; zeros((length(y_freq)-cut_off_freq*6.125),1)]; #putting 0s thereafter
figure(6);
plot(abs(low_pass_filter));
title("Low-pass Filter");

#in order to apply the ideal low pass filter, we multiply enteries of the input singal in it's frequency domain, i.e. y_freq, to the corresponding enteries of the ideal low pass filter created
y_low_pass_output = y_freq.*low_pass_filter;

#in order to reconstruct the signal, we take the inverse-fourier transform of the frequency domain output we obtained at the last step
y_low_pass_recons = ifft(y_low_pass_output);

#Figure 1 plots the comparision between Input signal and the signal reconstructed through ideal low-pass filter
figure(1);
subplot(2,1,1);
plot(abs(y));
title("Input Signal");
subplot(2,1,2);
plot(abs(y_low_pass_recons));
title("Reconstructed Signal (Ideal Low-Pass Filter)");

#The signal reconstructed through the Ideal low-pass filter has been written as an audio file
audiowrite("Output_low_pass_filter.wav", y_low_pass_recons, fs); 

#The frequency response of the signal reconstructed through the ideal-low pass filter has been obtained and its inverse fourier transform has been taken in order to get the impulse response
y_low_pass_freq_resp = y_low_pass_output./y_freq;
y_low_pass_impulse_resp = ifft(y_low_pass_freq_resp);

#Figure 2 plots the impulse response of the reconstructed signal through ideal low pass filter
figure(2);
plot(abs(y_low_pass_impulse_resp));
title("Impulse response of the Low-pass Filter");

#now we need to apply a high-pass filter upto 4kHz(4000Hz), in order to do this, we basically form an array of length same as that of the input signal in the frequency domain, with all its discrete values = 0 from 1 to 4000*6.125 and 1 thereafter. 
high_pass_filter = [zeros(cut_off_freq*6.125,1)]; #putting 0s from 1 to 4000*6.125th position of the array
high_pass_filter = [high_pass_filter; ones((length(y_freq) - cut_off_freq*6.125), 1)]; #putting 1s thereafter
figure(7);
plot(abs(high_pass_filter));
title("High-pass Filter");

#in order to apply the ideal high pass filter, we multiply enteries of the input singal in it's frequency domain, i.e. y_freq, to the corresponding enteries of the ideal high pass filter created
y_high_pass_output = y_freq.*high_pass_filter;

#in order to reconstruct the signal, we take the inverse-fourier transform of the frequency domain output we obtained at the last step
y_high_pass_recons = ifft(y_high_pass_output);

#Figure 3 plots the comparision between Input signal and the signal reconstructed through ideal high-pass filter
figure(3);
subplot(2,1,1);
plot(abs(y));
title("Input Signal");
subplot(2,1,2_);
plot(abs(y_high_pass_recons));
title("Reconstructed Signal (Ideal High-Pass Filter)");

#The signal reconstructed through the Ideal high-pass filter has been written as an audio file
audiowrite("Output_high_pass_filter.wav", y_high_pass_recons, fs);

#The frequency response of the signal reconstructed through the ideal-high pass filter has been obtained and its inverse fourier transform has been taken in order to get the impulse response
y_high_pass_freq_resp = y_high_pass_output./y_freq;
y_high_pass_impulse_resp = ifft(y_high_pass_freq_resp);

#Figure 4 plots the impulse response of the reconstructed signal through ideal low pass filter
figure(4);
plot(abs(y_high_pass_impulse_resp));
title("Impulse response of the High-pass Filter");

#Figure 5 plots the comparision between signal reconstructed through ideal low-pass filte and the signal reconstructed through ideal high-pass filter
figure(5);
subplot(2,1,1);
plot(abs(y_low_pass_recons));
title("Reconstructed Signal (Ideal Low-Pass Filter)");
subplot(2,1,2_);
plot(abs(y_high_pass_recons));
title("Reconstructed Signal (Ideal High-Pass Filter)");

