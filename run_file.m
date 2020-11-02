function run_file
% ========================================================================
% Compute the average of the function defined in myFunGrad_417.m.
% ========================================================================

fun_string = 'myFunGrad_417'; % Name of file holding the function.
numpoints  = 20;              % Number of points to be averaged over.
dimension  = 2;               % Gradient dimension of the function.

% Compute the average by calling the function average_417.m.

[fAvg, gAvg] = average_417(fun_string, dimension, numpoints);

fprintf('Average of the %g function and gradient evalutions: ',numpoints);
display(fAvg);
display(gAvg);

return