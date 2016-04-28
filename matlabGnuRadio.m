%% CODE FOR GENERATING PDF FUNCTIONS FOR GNU RADIO REPORT
%  J.L.F. Betting, student nr. 4016513

% pdf functions for the signals at the different locations
PsignalR = makedist('Normal','mu',-72, 'sigma',4.082);  % R'damseweg 416, signal + noise
PnosignalR = makedist('Normal','mu',-78, 'sigma',0.535); % R'damseweg 416, noise
PsignalH = makedist('Normal','mu',-59.1, 'sigma',6.719); % Heertjeslaan, signal + noise
PnosignalH = makedist('Normal','mu',-76.9, 'sigma',0.641); % Heertjeslaan, noise
PsignalB = makedist('Normal','mu',-61.7, 'sigma',8.557); % Bieslandse Kade, signal + noise
PnosignalB = makedist('Normal','mu',-77.3, 'sigma',0.463); % Bieslandse Kade, noise.

% Plotting the functions for every location
figure(1)
powerR = -80:0.05:-60;
plot(powerR,PsignalR.pdf(powerR), 'r');
hold on;
plot(powerR,PnosignalR.pdf(powerR),'b');
title('pdf of power at a frequency for Rotterdamseweg 416');
legend('signal + noise', 'noise');
xlabel('Frequency [MHz]');
ylabel('chance of power level');

figure(2)
powerH = -80:0.05:-40;
plot(powerH,PsignalH.pdf(powerH), 'r');
hold on;
plot(powerH,PnosignalH.pdf(powerH),'b');
title('pdf of power at a frequency for Heertjesweg');
legend('signal + noise', 'noise');
xlabel('Frequency [MHz]');
ylabel('chance of power level');

figure(3)
powerB = -80:0.05:-40;
plot(powerH,PsignalB.pdf(powerB), 'r');
hold on;
plot(powerH,PnosignalB.pdf(powerB),'b');
title('pdf of power at a frequency for Bieslandse Kade');
legend('signal + noise', 'noise');
xlabel('Frequency [MHz]');
ylabel('chance of power level');

figure(4)
R_type1 = 1-PnosignalR.cdf(powerR); % Chance of detection, while there is only noise
R_type2 = PsignalR.cdf(powerR);     % Chance of non-detection of signal

plot(powerR,R_type1,'r');
hold on;
plot(powerR,R_type2,'b');
title('chance of error for chosen detection treshold for Rotterdamseweg');
legend('Type I error', 'Type II error');
xlabel('Frequency [MHz]');
ylabel('chance of error');

disp('The minimal chance of error for Rotterdamseweg is:');
idealThresholdR = min(R_type1 + R_type2);
disp(idealThresholdR);
indexMinR = find((R_type1 + R_type2)==idealThresholdR);
disp('This is achieved by choosing a threshold [dB] of:');
powerR(indexMinR)

figure(5)
H_type1 = 1-PnosignalH.cdf(powerH); % Chance of detection, while there is only noise
H_type2 = PsignalH.cdf(powerH);     % Chance of non-detection of signal

plot(powerH,H_type1,'r');
hold on;
plot(powerH,H_type2,'b');
title('chance of error for chosen detection treshold for Heertjeslaan');
legend('Type I error', 'Type II error');
xlabel('Frequency [MHz]');
ylabel('chance of error');

disp('The minimal chance of error for Heertjeslaan is:');
idealThresholdH = min(H_type1 + H_type2);
disp(idealThresholdH);
indexMinH = find((H_type1 + H_type2)==idealThresholdH);
disp('This is achieved by choosing a threshold [dB] of:');
powerH(indexMinH)

figure(6)
B_type1 = 1-PnosignalB.cdf(powerB); % Chance of detection, while there is only noise
B_type2 = PsignalB.cdf(powerB);     % Chance of non-detection of signal

plot(powerB,B_type1,'r');
hold on;
plot(powerB,B_type2,'b');
title('chance of error for chosen detection treshold for Bieslandse Kade');
legend('Type I error', 'Type II error');
xlabel('Frequency [MHz]');
ylabel('chance of error');

disp('The minimal chance of error for Bieslandse Kade is:');
idealThresholdB = min(B_type1 + B_type2);
disp(idealThresholdB);
indexMinB = find((B_type1 + B_type2)==idealThresholdB);
disp('This is achieved by choosing a threshold [dB] of:');
powerB(indexMinB)