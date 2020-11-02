function [F,G]= myFunGrad_417(x)
%-------------------------------------------------------------------------
% Evaluates the function and gradient for the function
%          
%          f(x) = sin(x_1)*x_2 + x_2^2
%
% whose gradient is given by
%
%                 --                -- 
%     grad f(x) = | cos(x_1)*x_2     |
%                 | sin(x_1) + 2*x_2 |
%                 --                --
%-------------------------------------------------------------------------

% Get the individual components of the two dimensional vector x.

x1 = x(1) ;
x2 = x(2) ;

% Compute the value function f(x) and store it in F.

F = sin(x1)*x2 + x2^2 ;

% Compute the gradient of f at x and store it in G.

G1 = cos(x1)*x2     ;
G2 = sin(x1) + 2*x2 ;
G  = [ G1 ; G2 ]    ;

