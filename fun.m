function[v]=fun(x,opt)
%-------------------------------------------------------------------------
% Author : Shutian Li
% Date   : March 1, 2020
% Purpose: compute the function, gradient and Hessain for the function 
%   f(x)  =   10(x_2-x_1^2)^2+(x_1-1)^2
% 
% Whose gradient is given by: 
%                   --------------------------- 
%                       40x_1^3-40x_1x2+2x_1-2
%
%       grad f(x)=         20x_2-20x_1^2
%                   ----------------------------
%                       ------------------------------------
%       Hessain f(x) =  120x_1^2-40x_2+2            -40x_1
%                       -40x_1                      20
%                       ------------------------------------
%
%
%-------------------------------------------------------------------------

%Get the individual components of two dimensional vector x 
x1 = x(1);
x2 = x(2); 

% if opt = 0 return the function value 
if opt == 0
     v = 10*(x2-(x1^2))^2+(x1-1)^2;
end 

% if opt = 1 return the gradient 
if opt == 1
     g1 = 40*(x1^3)-40*x1*x2+2*x1-2;
     g2 = 20*(x2-x1^2);
     v  = [g1;g2];
end 

% if opt = 2 return the hessain 
if opt == 2 
    h11 = 120*(x1^2)-40*x2+2;
    h12 = -40*x1;
    h21 = -40*x1;
    h22 = 20;
    v   = [h11 h12;h21 h22];
end 
    