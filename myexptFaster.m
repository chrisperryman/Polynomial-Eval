function [M] = myexptFaster(A,n)
% Given inputs A, n, where A is a square matrix, and n an exponent. 
% myexptFaster(A,n) calculates the matrix M = A^n without using the built-in
% MatLab power function. Then stores it in a global variable, and reuses
% the calculated value if it is needed again.

% We retrieve and define our variables from the global variable: store.
global store
[k,Dim2,Dim3] = size(store);

if n == 0
    % In this case M is the identity matrix.
    M = eye(size(A));
    
elseif isnan(store(n,:,:)) == zeros(Dim3,Dim3)
    % Check if n is already stored, if it is retrieve
    % its value, set M equal to it.
    M = reshape(store(n,:,:),[Dim3,Dim3]);
    
elseif mod(n,2) == 0
    % If n is even, calculate (A^(n/2))^2 using myexptFaster recursively.
    var1 = myexptFaster(A,n/2);
    M = var1 * var1;
    % Once M has been calculated, store it.
    store(n,:,:) = M;
    
elseif mod(n,2) == 1
    % If n is odd, calculate A*(A^((n-1)/2))^2 using myexptFaster recursively.
    var2 = myexptFaster(A,(n-1)/2);
    M = A * var2 * var2;
    % Once M has been calculated, store it.
    store(n,:,:) = M;
    
else    
    % If all goes well, this line should never be reached.
    error("Unexpected Error!");
end

end