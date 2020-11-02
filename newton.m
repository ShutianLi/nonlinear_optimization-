function[x,f,fp,iter,status]=newton(Fun,x0,maxit,printlevel,tol)
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
[f0,fp0]   =       feval(Fun,x0)   ;
x          =       x0              ;
f          =       f0              ;
fp         =       fp0             ;
iter       =       0               ;
status     =       1               ;

while iter<=maxit
    if printlevel == 1
       fprintf(' %4g  %13.6e  %13.6e \n', iter, norm(f), norm(fp));
    else 
       fprintf('\n iter |f|  |fp| \n');
       printlevel = 1; 
    end 
    iter =iter+1  ;
    s    =fp\(-f) ;
    x    =x+s     ;
    [f,fp]=feval(Fun,x) ;
    
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

return 
end

