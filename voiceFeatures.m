function [x_Pitch] = voiceFeatures(data)
    F = fft(data(:,1)); % converts time domain data to frequency domain of channel 1
%     plot(real(F)) % plots the real part of the data
    m = max(real(F)); % max value of real(F)
    x_Pitch = find(real(F) == m, 1); % finds the first indice of max value of real(F)
end
% FFT is always symmetric from the center.
% The highest value on the Y-axis is called the pitch.