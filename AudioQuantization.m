%% Recording the Voice
disp('RECORDING');
Fs  = 48000; % 48000 Sampling frequency
Bps = 8;     % 8 Bits Per Sample
Nc  = 1;     % 1 channel
T   = 5;     % Recording time

audio = audiorecorder(Fs,Bps,Nc); % Begin recording
recordblocking(audio,T);          % Recording for 5 seconds
y = getaudiodata(audio);          % Converting to integer

disp('RECORDING OVER');

%% Plotting the orignal audio
disp('PLAYING AUDIO');
soundsc(y, Fs);       % Playing the audio
figure(1);
plot(y);              % Original audio signal is plotted


%% Plot after samplingg
Ns = 2                % Nth sample
y = downsample(y,Ns); % Sampling rate (Fs = 24000Hz)
figure(2);
plot(y);              % New audio signal is plotted


%% Quantization Level
l = length(y);        % number of samples
maxy = max(y);
miny = min(y);
r = maxy - miny;
Q = r/12;             % quantize it to 12 levels

% Quantised audio is stored in variable x
k = 1;
for i = miny:Q:maxy
    div(k) = i * Q;
    k = k + 1;
end

for i = 1:1:l
    if(y(i) < div(1))
        x(i) = div(1);
    end
    for j = 1:1:12
        if(div(j) <= y(i) && y(i) < div(j+1))
            x(i) = div(j);
        end
    end
    if(y(i) >= div(13))
        x(i) = div(13);
    end
end

% Quantised audio is plotted
figure(3);
plot(x)     


%% Plot of Fourier Transform
fs = Fs/Ns;               % new sampling frequency
n  = length(y);           % number of samples
y0 = fftshift(y);         % shift y values
f0 = (-n/2:n/2-1)*(fs/n); % 0-centered frequency range
power0 = abs(y0).^2/n;    % 0-centered power


figure(4)
plot(f0,power0)
xlabel('Frequency')
ylabel('Power')

disp('END')