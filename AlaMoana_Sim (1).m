clc; close all; clear;

% Get data from file
%fast car
dataSet = readmatrix('Car0Pos.txt'); % read txt file data in matrix form
%slow car
dataSet2 = readmatrix('Car1Pos.txt');

timeStamp = 0.0:1:69; % change the last value in the case to total steps in sim 

%distRSU1 = dataSet(:,7); % obtain data from column 3
%distRSU1_2 = dataSet2(:,7);
%distRSU2_2 = dataSet2(:,11);
%timeStamp = dataSet(:,2); % obtain data from column 2

% Interval of interest
%itv = 1:516;

% Parameters
c = 299792458; % speed of light
wavelength = c/(5.89*10^9); % wavelength at C-V2X 5.8GHz carrier

% Placement of RSU from SUMO
y_rsu_1 = 421.00; x_rsu_1 = 223.00; % Koula receiver coordinates
y_rsu_2 = 430.82; x_rsu_2 = 234.29; % Cooke receiver coordinates

%Create matrix consisting of each timestep of simulation
%t=zeros(68,1); %68 total times from 0s to 67s
%for i=1:68
 %   t(i,1)=i-1;
%end

%Car coordinate data
%Fast_x=[312.4;310.6;306.51;301.14;293.58;284.70;275.04;264.16;254.80;245.94;240.46;240.01;239.90;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;239.89;238.71;235.62;230.24;223.94;216.68;207.95;198.33;187.70;177.30;166.41;155.43;145.27;134.62;126.87;116.60;106.38;95.85;85.86;75.93;66.93;57.90;48.83;39.17;29.73;22.65;17.16;14.90;13.29;13.29;13.29;13.29];
%Fast_y=[357.39;358.23;360.16;362.68;366.23;370.41;376.10;383.82;394.95;404.00;410.03;415.28;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;415.41;416.63;419.54;423.11;429.33;437.40;447.12;457.82;469.51;480.90;492.83;505.09;516.79;529.04;542.85;554.67;566.44;578.56;590.06;601.64;614.03;626.48;638.98;652.28;665.54;680.12;695.62;711.71;727.49;727.49;727.49;727.49];
%Slow_x=[315.28;313.76;310.28;305.52;299.49;291.18;280.88;270.12;261.25;252.28;246.03;242.60;242.18;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;242.15;240.49;236.96;231.94;226.56;220.15;212.60;203.71;194.02;184.44;175.07;165.44;156.23;146.70;137.69;128.59;119.69;110.90;102.10;93.12;83.70;74.65;66.51;57.99;49.57;41.57;33.06;26.22;20.55;16.62;14.93;13.52];
%Slow_y=[363.11;363.83;365.46;367.70;370.53;374.43;379.84;387.27;397.56;406.58;413.41;417.19;417.65;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;417.68;419.35;422.41;425.77;431.20;438.33;446.74;456.62;467.34;477.83;488.09;498.63;509.04;520.01;530.39;540.87;551.11;561.23;571.36;581.70;592.55;603.40;614.61;626.35;637.95;648.98;660.70;672.69;684.90;697.64;711.46;725.29];
Fast_x = dataSet(1,:);
Fast_y = dataSet(2,:);
Slow_x = dataSet2(1,:);
Slow_y = dataSet2(2,:);
x_Center = (Fast_x + Slow_x)/2;
y_Center = (Fast_y + Slow_y)/2;
x_CenterOffset = (Fast_x + Slow_x)/2;
y_CenterOffset = (Fast_y + Slow_y)/2;
% % Calculate distance between car X & RSU Y
%distRSU1 = sqrt((Slow_x - x_rsu_1).^2 + (Slow_y - y_rsu_1).^2);
%distRSU2 = sqrt((Slow_x - x_rsu_2).^2 + (Slow_y - y_rsu_2).^2);
%distRSU1_2 = sqrt((Fast_x - x_rsu_1).^2 + (Fast_y - y_rsu_1).^2);
%distRSU2_2 = sqrt((Fast_x - x_rsu_2).^2 + (Fast_y - y_rsu_2).^2);

distRSU1_center = sqrt((x_Center - x_rsu_1).^2 + (y_Center - y_rsu_1).^2);
distRSU2_center = sqrt((x_Center - x_rsu_2).^2 + (y_Center - y_rsu_2).^2);
distRSU1_centeroffset = sqrt((x_CenterOffset - x_rsu_1).^2 + (y_CenterOffset - y_rsu_1).^2);
distRSU2_centeroffset = sqrt((x_CenterOffset - x_rsu_2).^2 + (y_CenterOffset - y_rsu_2).^2);
% 
% % Calculate angular frequency
 %w1 = distRSU1/wavelength; % receiver 1
 %w2 = distRSU2/wavelength; % receiver 2
 %w3 = distRSU1_2/wavelength;
 %w4 = distRSU2_2/wavelength;
 w1 = distRSU1_center/wavelength;
 w2 = distRSU2_center/wavelength;
 w3 = distRSU1_centeroffset/wavelength;
 w4 = distRSU2_centeroffset/wavelength;
 %phase diff between the two RSU's at each time step
 %idk if this is right or needed, but it's here if we need it
 %phaseDiffForCar1 = 2 * pi * (distRSU1-distRSU2)/wavelength;
 %phaseDiffForCar2 = 2 * pi * (distRSU1_2-distRSU2_2)/wavelength;
% 
 % % Calculate Free-space Path Loss 
 % since the distance to the RSU is the only var, the power is constant
 % and proportional to the inverse square of the distance
 % wavelength./(4*pi*distRSU#) = power per unit area 
 %P1 = (wavelength./(4*pi*distRSU1)).^2; %referenced to mW, not W
 %P2 = (wavelength./(4*pi*distRSU2)).^2;
 %P3 = (wavelength./(4*pi*distRSU1_2)).^2;
 %P4 = (wavelength./(4*pi*distRSU2_2)).^2;
 P1 = 1e3*(wavelength./(4*pi*distRSU1_center)).^2;
 P2 = 1e3*(wavelength./(4*pi*distRSU2_center)).^2;
 P3 = 1e3*(wavelength./(4*pi*distRSU1_centeroffset)).^2;
 P4 = 1e3*(wavelength./(4*pi*distRSU2_centeroffset)).^2;
% 
% % Calculate channel matrix components
 h1 = P1.*exp(-1i*2*pi.*w1);
 h2 = P2.*exp(-1i*2*pi.*w2);
 h3 = P3.*exp(-1i*2*pi.*w3);
 h4 = P4.*exp(-1i*2*pi.*w4);
% 
% % Calculate channel condition number
 H = [h1, h2; h3, h4];
 %H = [h1; h2];
% 
 %data = dataSet(:,:); % obtain data from column 3
% 
% % Calculate channel condition number for each 2x2 matrix
 H = zeros(2,2,length(h1));
 chan_cap = zeros(length(h1),1);
 h_chan_cap = zeros(length(h1),1);
 cond_num = zeros(length(h1),1);
 rank_num = zeros(length(h1),1);
% 
 BW = 25e6;
 SNR_r = 10^(15/10); %decimal SNR, not dB
% 

 for ii = 1:length(h1)
   H(:,:,ii) = [h1(ii) h2(ii); h3(ii) h4(ii)];
   %H(:,:,ii) = [h1(ii) h2(ii); h2(ii) h1(ii)]; %this definitely doesnt look right
   chan_cap(ii) = BW*log2(det(eye(2)+(SNR_r)*abs(H(:,:,ii)*H(:,:,ii)')));
   cond_num(ii) = cond(H(:,:,ii));
   rank_num(ii) = rank(H(:,:,ii));
   eiganV = eig(H(:,:,ii));
   
   %for large SNR
   %h_chan_cap(ii) = rank_num(ii) * log(SNR_r) + log(abs(eiganV(1,1)* eiganV(1,1))/rank_num(ii)) + log(abs(eiganV(2,1) * eiganV(2,1))/rank_num(ii));
 end
% % 
  % printf('Time:dataset(:,1)')
% 
 %Plot channel condition number for each timestamp
 plot(timeStamp, cond_num)
 ylabel('cond num'); xlabel('Timestamp'); title('');
 grid on % display grid lines
% 
 % Plot capacity for each timestamp
 %plot()
 %ylabel('Channel Capacity'); xlabel('Timestamp'); title('');