clear all
close all
clc

%% Creating a recorder object
recorder = audiorecorder(16000, 8, 2); % Sampling freq/number of samples per second = 16000 Hz, 8 bits, 2 channels.

%% Record the user's voice for 5s
disp("Please say something.")
pause(1) % pauses for 1s.
recordblocking(recorder, 5); % records the audio to recorder object for 5s. MATLAB will be blocked for 5s and will not be able to perform any other task.

%% Play the user's voice
play(recorder); % plays the audio from the recorder object.
data = getaudiodata(recorder); % extracts the data and stores in the variable "data" in a 8000 x 2 matrix.
% plot(data); % plots the data.
% xlabel("Frequency") 
% ylabel("Normalized values between -1 to 1")
% title("Audio sample")

%% Feature Extraction
f = voiceFeatures(data);

%% Save the user database

user = input("Enter the user number: "); % takes the input and stores it in user.
try % Execute statements and catch resulting errors.
    load database
    F = [F; f];
    C = [C; user];
    save database
catch 
    F = f;
    C = user;
    save database F C
end

msgbox("Voice registered!") % creates a dialogue box