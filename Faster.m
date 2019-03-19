function [p] = Faster(index,b,x)
% Faster calculates the value of a matrix polynomial given the 3D array of 
% coefficients b, the matrix x and index, a vector of the powers of x we 
% want to calculate. It stores previously calculated powers so they don't 
% have to be recalculated.

% Define our variables.
[k,Dim2,Dim3] = size(b);

% This function checks for anything that might throw an error and catches it.
if ErrorChecker(index,b,x) == 2
    % Return zero polynomial.
    p = zeros(Dim2,Dim3);
    return

end

% Define our variables, Initialise store as a global variable.
[xDim1, xDim2] = size(x);
global store
store = NaN(100,xDim1,xDim2);

% We reshape the 3D array to remove the 1 dimension.
% Changing it from a 1xDim2xDim3 to a Dim2xDim3.
p = reshape(b(k,:,:),[Dim2,Dim3]);

for i = 1:(k-1) 
    % Apply Horners Rule, calling myexptFaster to calculate
    % and save powers of x.
    p = reshape(b(k-i,:,:),[Dim2,Dim3]) + ...
        p * myexptFaster(x,index(1,k-i+1) - index(1,k-i));
    
end

% Multiply by the final x power, see Horners Rule.
p = p * myexptFaster(x,index(1,1));

end