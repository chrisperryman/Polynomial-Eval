function [result] = ErrorCheckerSimple(a,x)
% This function checks for things that may throw errors in the Parent function.
% If it finds something that would throw an error, it throws that error here.

% We define our variables.
[xDim1, xDim2] = size(x);
[aDim1, aDim2, aDim3] = size(a);


if xDim1 ~= xDim2
    % Check that x is a square matrix.
    error('The input x must be a square matrix.');
    
elseif aDim1 == 0
    % Checks for the zero polynomial.
    result = 2;
    return
end

aisScalar = (aDim2 == 1 && aDim3 == 1);
xisScalar = (xDim1 == 1 && xDim2 == 1);

if aisScalar || xisScalar || (aDim3 == xDim1)
    % Check that a and x are compatible.
    result = 1;
    
else    
    error('The matrices x and a(k,:,:) are incompatible.');

end