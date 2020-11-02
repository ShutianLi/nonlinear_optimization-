function[p,res,iter,flag]=truncated_CG_LS(H,g,tol)
%-------------------------------------------------------------------------
% Author : Shutian Li
% Date   : March 1, 2020
% Purpose: compute a search direction for line search method based on the
% runcated Newton-CG method of algorithm 9 
%
% Input
% -----
%   H : symmetric matrix 
%   g : vector with length the same as the number of columns of H 
% tol : tol>0 is a termination tolerance 
%
% Ouput
% -----
%   p : computed search direction 
%  res: nonnegative scalar containing final computed residual
% iter: nonnegative integar holding the number of iterations performed by
%       the truncated Newton-CG-method 
% flag: contain value 0 if negative curvature was not encountered and 1
%       otherwise 
%-------------------------------------------------------------------------
iter    = 0     ;
r0      = g     ;
s0      = -g    ;
p       = zeros(size(g))     ;
r       = r0    ;
s       = s0    ; 


while norm(r)> tol*max(1,norm(r0))
    if s'*H*s > 0 
        a = (r'*r)/(s'*H*s);
    else
        if iter==0
         p    = -g;
        end
         flag = 1 ;
         res  = r ;
         return
    end 
    p         = p + a * s;
    r_bar     = r             ;
    r         = r + a*H*s     ;
    beta      = (r'*r)/(r_bar'*r_bar);
    s         = -r+beta*s;
    iter      = iter + 1;
end 
res  = norm(r);
flag = 0      ; 
end 


    
    
        
        




        


    

