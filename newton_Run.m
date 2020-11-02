function HW_2_Run
% ========================================================================
% Compute the average of the function defined in newton.
% ========================================================================
fun_string      =       'Fun'           ;   %the function of holding function 
x_start         =       [1/5;-1/5;4/5;1];   %starting point 
tole            =       1.0e-14         ;   %tolerance value   
max_iter        =       50              ; 
print_level     =       1               ;
      

[x,f,fp,iter,status]=newton(fun_string,x_start,max_iter,print_level,tole);
return 


