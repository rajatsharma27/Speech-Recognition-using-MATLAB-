clear all
close all
clc

%% Creating a recorder object
recorder = audiorecorder(16000, 8, 2); % 16000 Hz, 8 bits, 2 channels

%% Record the user's voice for 5s
disp("Please say something.")
drawnow(); % update figures and process callbacks
pause(1) % pauses for 1s
recordblocking(recorder, 5); % records the audio to recorder object for 5s.

%% Play the user's voice
play(recorder); % plays the audio from the recorder object
data = getaudiodata(recorder); % data is stored in a 8000 x 2 matrix.
% plot(data); % plots the data
% xlabel("Frequency") 
% ylabel("Normalized values between -1 to 1")
% title("Audio sample")

%% Feature Extraction
f_test = voiceFeatures(data)

%% Find the closest feature from database.
load database
D = [];
for i = 1:size(F, 1)
    distance = abs(F(i) - f_test); % calculates the distance between the stored value in the database and the test value.
    D = [D distance]; % adds the distance d to the vector D.
end

%% Smallest distance
smallest_distance = inf; % initially, we take the smallest distance to be infinity.
index = 0; % initially, we take the index to be 0
for i = 1:length(D)
    if D(i) < smallest_distance % if the current distance is smaller than the smallest distance.
        smallest_distance = D(i); % then replace the smallest distance with the current distance.
        index = i; % change the index to the current distance's index.
    end
end

detected_class = C(index);
disp('The detected class is ');
detected_class