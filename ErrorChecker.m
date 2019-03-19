function [result] = ErrorChecker(index,b,x)
% This function checks for things that may throw errors in the Parent function.
% If it finds something that would throw an error, it throws that error here.

% We define our variables.
[Dim1, Dim2, Dim3] = size(b);
[xDim1,xDim2] = size(x);
[iDim1, iDim2] = size(index);
result = 0;

if iDim2 ~= Dim1
    % Check for index being same length as b.
    error('index is not the same length as the coefficient matrix b.)');
elseif (iDim1 == 0 || iDim2 == 0) && Dim1 == 0
    % Checks for the zero polynomial.
    result = 2;
    return
end

bisScalar = (Dim2 == 1 && Dim3 == 1);
xisScalar = (xDim1 == 1 && xDim2 == 1);

if bisScalar || xisScalar || Dim3 == xDim1
    % Checks the compatibility of matrices b,x being multiplied together.
    for i = 1:iDim2
        
        if imag(index(i)) ~= 0
            % Checks for imaginary inputs.
            error('All elements in index must be strictly real.');
            
        elseif mod(index(i),1) == 0 && index(i) >= 0 && index(i) < 101 
            % Checks for non integer and negative index inputs,
            % making sure they're all less than 100.
        else
            error('All elements in index must be non negative ' + ...
            'integers, smaller than 101.');
        end
        
    end
    
else 
    error('The coefficient matrix b(k,:,:) and x are incompatible.');
end

% Now we check that index is in numerically increasing order.
index_element = index(1);

for i = 2:iDim2
    
    if index(i) > index_element 
        index_element = index(i);
        
    else
        error('The vector index MUST be in numerically increasing order.');
    end

end

result = 1;

end