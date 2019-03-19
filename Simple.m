function [p] = Simple(a,x)
% Evaluates a matrix polynomial, taking inputs a, x, and returning the value
% of the polynomial. Where x is the variable and a is an ordered 3D array of
% matrix coefficients.

% We Define our variables.
[n, Dim2, Dim3] = size(a);

% This function checks for anything that might throw an error and catches it.
if ErrorCheckerSimple(a,x) == 2   
    % Return zero polynomial.
    p = zeros(Dim2,Dim3);
    return
    
end

% We reshape the 3D array to remove the 1 dimension.
% Changing it from a 1xDim2xDim3 to a Dim2xDim3.
p = squeeze(a(n,:,:));

for i = 2:n
    % Loop through, following Horners rule. Including calculating the x's
    % when its corresponding coefficient is zero. 
    p = squeeze(a(n+1-i,:,:)) + p * x;
    
end

end