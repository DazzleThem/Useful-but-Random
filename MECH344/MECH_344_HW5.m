%%
%6 March 2020 
%Becky Coonen
%MECH 344 Heat and Mass Transfer HW5 Problem 1
%Solver to analytically calculate nondimensional temperature difference (Theta) of a plane wall. The equation is simplified
%from a summation to infinity by assuming fours terms are sufficient for
%Fo < 0.2. 
%Theta indicates a difference of temperatures and not a temperature itself.


%Inputs: 
    %Fo = Fourier number
    %Bi = Biot number
    %Eg = eigenvalue obtained from literature corresponding to chosen Fo and Bi
    %x = non-dimensionalized location in x direction

%Outputs:
    %Theta = nondimensionalized ratio of temperature differences. 
        %0 < theta* < 1
promptFo = 'Enter Fourier Number';
Fo = input(promptFo);
promptBi = 'Enter Biot Number';
Bi = input(promptBi);

promptEg1 = 'Enter Eigenvalue 1';
Eg1 = input(promptEg1);

promptEg2 = 'Enter Eigenvalue 2';
Eg2 = input(promptEg2);

promptEg3 = 'Enter Eigenvalue 3';
Eg3 = input(promptEg3);

promptEg4 = 'Enter Eigenvalue 4';
Eg4 = input(promptEg4);

promptx = 'Enter x location';
x = input(promptx);

%calculate first four coefficients
C1 = (4*sin(Eg1))/(2*Eg1 + sin(2*Eg1));  
C2 = (4*sin(Eg2))/(2*Eg2 + sin(2*Eg2));
C3 = (4*sin(Eg3))/(2*Eg3 + sin(2*Eg3));
C4 = (4*sin(Eg4))/(2*Eg4 + sin(2*Eg4));
Theta = C1*exp(-(Eg1^2)*Fo)*cos(Eg1*x) + C2*exp(-(Eg2^2)*Fo)*cos(Eg2*x) + C3*exp(-(Eg3^2)*Fo)*cos(Eg3*x) + C4*exp(-(Eg4^2)*Fo)*cos(Eg4*x) %calculate ratio of temperature differences

%%
%MECH 344 HW5 Problem 2 Part C
%This section graphs 1D Ttemerature change with horizontal position through
%a glass plate experiencing convection at either edge. 
% x = 0 is the midplane

a = .000006; %thermal diffusivity [m^2/s]
t = 10; %time [s]
Lc = .005; %characteristic length [m]
Fo = a*t/(Lc^2); %Fourier number [unitless]
Ts = 273; %Surface temperature [K]
Tinf = 27; %Surrounding temperature [K]
C = 1.27; %constant
Eg = pi/2; %eigenvalue for Bi = infinity
L = .01; %Length of plate [m] 
x = linspace(-5,5); %x along length of plate [mm]

%Equation describing temperature as a function of x
T = (Ts - Tinf)*(C*exp(-(Eg^2)*Fo))*cos(Eg.*x/L/1000) + Tinf;
plot(x, T)
xlabel('Horizontal Position (mm)')
ylabel('Temperature (K)')
