function[x,F,G,H,iter,status]=uncMIN(fun,x0,dir_type,maxit,printlevel,tol)
format short;
format compact;
%-------------------------------------------------------------------------
% Author : Shutian Li
% Date   : March 1, 2020
% Purpose: minimize a twice continuously-differentiable function f using a
%          backtracking-Armijo linesearch method.
%
% Input
% -----
% fun           a function that compute the value, gradient and hessain. 
% x0            initial guess at a minimizer of f
% dir_type      the type of search direction that should be computed 
% maxit         maximum number of iterations allowed 
% printlevel    the amount of printout required 
% tol           the final stopping tolerance 
% 
% Ouput
% -----
% x: final iterate
% F: function value; 
% G: gradient vector;
% H: Hessain matrix;  
% iter: the total number of iterations performed
% status =0 if the final stopping tolerance was obtained; =1 otherwise 
%-------------------------------------------------------------------------

tic   %start time of operation 

iter       = 0              ;
x          =x0              ; 
F0         =feval(fun,x0,0) ;
G0         =feval(fun,x0,1) ;
F          =F0              ;
G          =G0              ;
norm_G0    =norm(G0)        ;
H          =NaN             ;



%paramter of Armijo linesearch method 
alpha_init =1               ; 
alpha      =alpha_init      ;
tau        =0.5             ;
eta        =0.01            ;
k          =0               ;

%print head
if printlevel ~= 0
    if dir_type==0 
    fprintf('steepest descent direction');
    elseif dir_type == 1 
    fprintf('modified Newton method');
    elseif dir_type == 2 
    fprintf('truncated Newton CG method');
    end 
    fprintf('\n   iter    |g|              |F|   \n');
end 




%A backtracking Armijo linesearch method 
while norm(G)>tol*max(1,norm_G0)
    
% choose the type of search direction 
if dir_type == 0 % choose the steepest descent direction 
    p       = -G           ;
elseif dir_type == 1  %choose the modified newton method 
    H   = feval(fun,x,2);
    %calculate matrix B
    [B,~]= modNewton(H,1.0e-8,1.0e14);
    % return the gradient 
    p        = B\-G        ;
    
elseif dir_type == 2 %choose linear CG method 
    H        = feval(fun,x,2);
    [p,~,~]= truncated_CG_LS(H,G,1.0e-8);
end 


%compute the stepsize alpha_k 
while feval(fun,x+alpha*p,0)>feval(fun,x,0)+eta*alpha*G'*p
    alpha=tau*alpha;
    k    =k+1;
end 


x = x+alpha*p;
G = feval(fun,x,1); 
F = feval(fun,x,0);


if iter>=maxit
    status = 1;
    break 
else 
    status = 0;
end 

iter = iter+1  ;

if printlevel ~=0 
   fprintf(' %4g  %13.6e  %13.6e \n', iter, norm(G), norm(F));
end 


iter = iter+1  ;

end 

time = toc; % final time of operation 

%check the status
if status == 1
    fprintf('exceed the maximal iteration \n');
    fprintf('\n status = 1 \n');
elseif status == 0 
    fprintf('\n status = 0 \n');
end 

fprintf('Total time');
fprintf('%4e',time);
    

    
    




    




