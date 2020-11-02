format short; 
format compact; 
%-------------------------------------------------------------------------
% Author : Shutian Li
% Date   : February 15, 2020
% Purpose: Perform Newtown's method for finding a zero of a function F
%
% Input
% -----
% Fun           a function handle or string of the name of an m-file function that
%               is of the form [F,J] = Fun(x). Fun returns the function and
%               Jacobian values F and J, respectivaly, of a desired function.
% x0            initial guess of zero 
% maxit         maximum number of iterations allowed 
% printlevel    the amount of printout required 
% tol           the final tolerance 
% 
% Ouput
% -----
% x: final iterate
% F: function value; 
% J: Jacobian matrix 
% iter: the total number of iterations performed
% status =0 if the final stopping tolerance was obtained; =1 otherwise 
%-------------------------------------------------------------------------

x0         =       [1/5;-1/5;4/5;1];
tol        =       1.0e-14         ;
[f0,fp0]   =       Fun(x0)         ;
x          =       x0              ;
f          =       f0              ;
fp         =       fp0             ;
iter       =       0               ;
maxit      =       50              ; 
status     =       1               ;
printlevel =       0               ;

while iter<=maxit
   if printlevel == 0
       fprintf('\n iter   |f|         |fp| \n');
       printlevel=printlevel+1;
   end 
    iter =iter+1  ;
    s    =fp\(-f) ;
    x    =x+s     ;
    [f,fp]=Fun(x) ;
    if printlevel==1
       fprintf('  %g   %e   %e \n', iter, norm(f), norm(fp));
    end   
    
    if norm(f)<=tol*norm(f0)
        status = 0;
        fprintf('    status = 0') 
        return
    else 
        status = 1; 
    end 
end 

if status == 1 
    fprintf('    status = 1 ');
end 



%-------Fun function for caluculate Jacobian-------------------
function[F,J]=Fun(x)
x1=x(1:3);
lambda=x(4);
A=[4 2 1;2 3 0;1 0 1];
I=eye(3);
l=lambda*I;
%compute the value function f at x and store it in F 
F = [(A-l)*x1;(transpose(x1)*x1-1)];
%compute the jacobian of f at x and store it in J
j11 = (A-l)';
j12 = (-x1);
j21 = (2*x1)';
j22 = 0; 
J= [j11 j12;j21 j22];
return 
end 

