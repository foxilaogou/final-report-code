function [fitresult, gof] = createFit(x1, y)
%CREATEFIT(X1,Y)
%  Create a fit.
%
%  Data for 'untitled fit 1' fit:
%      X Input : x1
%      Y Output: y
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%
%  另请参阅 FIT, CFIT, SFIT.

%  由 MATLAB 于 01-Apr-2023 10:25:10 自动生成


%% Fit: 'untitled fit 1'.
[xData, yData] = prepareCurveData( x1, y );

% Set up fittype and options.
ft = fittype( 'exp1' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.StartPoint = [841.646396500801 0.000680661962055398];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'untitled fit 1' );
h = plot( fitresult, xData, yData );
legend( h, 'y vs. x1', 'untitled fit 1', 'Location', 'NorthEast' );
% Label axes
xlabel x1
ylabel y
grid on




