%% Design array of Gabor Filters
% In this code section, you will create a Gabor Filterbank. A filterbank is
% a collection of filters with varying properties (e.g. {shape, texture}).
% A Gabor filterbank consists of Gabor filters of distinct orientations
% and scales. We will use this bank to extract texture information from the
% input image. 

% [numRows, numCols, ~] = size(img);
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
dTheta      = 2*pi/8;                  % \\ the step size
orientations = 0:dTheta:(pi/2);       

% Define the set of sigmas for the Gaussian envelope. Sigma here defines 
% the standard deviation, or the spread of the Gaussian. 
% sigmas = [1,2]; 
sigma = 4;
theta = pi/4;
lambda = lambdaMin;
psi    = 0;
gamma  = 0.5;
[myGabor, x, y] = createGabor( sigma, theta, lambda, psi, gamma );
figure(1);
subplot(121);
realPart = myGabor(:, :, 1);
imgPart = myGabor(:, :, 2);
contourf(x,y,realPart,'EdgeColor','black')
xlabel('x axis');
ylabel('y axis');
zlabel('real part');

subplot(122);
surf(x,y,realPart,'EdgeColor','black')
xlabel('x axis');
ylabel('y axis');
zlabel('img part');


figure(2);

subplot(121);
realPart = myGabor(:, :, 1);
imgPart = myGabor(:, :, 2);
contourf(x,y,imgPart,'EdgeColor','black')
xlabel('x axis');
ylabel('y axis');
zlabel('real part');

subplot(122);
surf(x,y,imgPart,'EdgeColor','black')
xlabel('x axis');
ylabel('y axis');
zlabel('img part');

