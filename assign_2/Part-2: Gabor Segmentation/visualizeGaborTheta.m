close all;clear;
numRows = 400;
numCols = 300;
% Estimate the minimum and maximum of the wavelengths for the sinusoidal
% carriers. 
% ** This step is pretty much standard, therefore, you don't have to
%    worry about it. It is cycles in pixels. **   
lambdaMin = 4/sqrt(2);
lambdaMax = hypot(numRows,numCols);

% Specify the carrier wavelengths.  
% (or the central frequency of the carrier signal, which is 1/lambda)
n = floor(log2(lambdaMax/lambdaMin));
lambdas = 2.^(0:(n-2)) * lambdaMin;

% Define the set of orientations for the Gaussian envelope.
dTheta      = pi/4;                  % \\ the step size
orientations = 0:dTheta:(3*pi/4);       

% Define the set of sigmas for the Gaussian envelope. Sigma here defines 
% the standard deviation, or the spread of the Gaussian. 
% sigmas = [1,2]; 
sigma = 1;
lambda = lambdaMin; % 4/sqrt(2)
psi    = 0;
gamma  = 0.5;
figure(1);
for i = 1:length(orientations)
    theta = orientations(i);
    [myGabor, x, y] = createGabor( sigma, theta, lambda, psi, gamma);
    subplot(2,2, i);
    imgPart = myGabor(:, :, 2);
    contourf(x,y,imgPart);colorbar;
    xlim([-5 5]);
    ylim([-5 5]);
    xlabel('x axis');
    ylabel('y axis');
    zlabel('img part');
    title(sprintf("theta= %.2f pi", theta/pi));
end

figure(2);
for i = 1:length(orientations)
    theta = orientations(i);
    [myGabor, x, y] = createGabor( sigma, theta, lambda, psi, gamma);
    subplot(2,2, i);
    imgPart = myGabor(:, :, 2);
    surf(x,y,imgPart);colorbar;
    xlim([-5 5]);
    ylim([-5 5]);
    xlabel('x axis');
    ylabel('y axis');
    zlabel('img part');
    title(sprintf("theta= %.2f pi", theta/pi));
end