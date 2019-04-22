%This program graphs a Mohr's circle for given values of theta, normal
%stress, and shear stress.
%INPUTS 4
%   t = theta, angle in degrees
%   sigmaxx = the value of normal stress in the x direction on the x face
%   sigmayy = the value of normal stress in the y direction on the y face
%   tauxy = the value of shear stress in the x or y direction on the x or y face
t = 1; %set up t to be our counter in the for loop
sigmaxx = input('Input value of normal stress on x face in x direction in ksi: ')
fprintf('\n')
sigmayy = input('Input value of normal stress on y face in y direction in ksi: ')
tauxy = input('Input value of shear stresses in ksi: ')

hold on %prevent values from being overwritten
for t = 1:180
    sigma = sigmaxx*cosd(t)*cosd(t)+ 2*tauxy*sind(t)*cosd(t) + sigmayy*sind(t)*sind(t); %this is the expression for total normal stress dervied in class
    tau = -sigmaxx*sind(t)*cosd(t) + tauxy*(cosd(t))^2 - tauxy*(sind(t))^2 + sigmayy*cosd(t)*sind(t); %the expression for total shear stress derived in class
    plot (sigma,tau ,'.')
    t=t+1; 
end
xlabel('Normal Stress in ksi') %name the x axis and give units
ylabel('Shear Stressin ksi') %name the y axis and give units
title('All possible values of shear and normal stress') %title graph
pbaspect([1,1,1]) %sets the ratios of x,y,z axes. A 1:1:1 ratio ensures the circle looks like a circle
