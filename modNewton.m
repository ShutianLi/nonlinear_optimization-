function[B,flag] = modNewton(H,lam_min,lam_max)
%-------------------------------------------------------------------------
% Author : Shutian Li
% Date   : March 1, 2020
% Purpose: Compute a modified Newton matrix
%
% Input
% -----
% H      :  a symmetric matrix 
% lam_min:  the lower bound 
% lam_max:  the upper bound 
% Ouput
% -----
% B   :modified positive-definite matrix 
% flag:contain 0 if no modificatioon was requird and value 1 otherwise
%-------------------------------------------------------------------------

%return the eigenvalue diag-matrix D and its eigenvector V
[V,D] = eig (H) ;
 d    = diag(D);
 D_bar= D      ;
 l    =size(D,1);
 flag =0;
%compute the new_eigenvalue for matrix B when D is not positive definite  
 for i = 1 : l
        if d(i)  > lam_max
            D_bar(i,i) = lam_max;
            flag       = 1;
        elseif d(i) < lam_min
            D_bar(i,i) = lam_min;
            flag       = 1      ; 
        end  
 end 
 B = V'* D_bar * V;  
end 
 
         
         
     
 




