function [M] = myexpt(A,n)
% Given inputs A, n, where A is a square matrix, and n an exponent. 
% myexpt(A,n) calculates the matrix M = A^n without using the built-in
% MatLab power function.

if n == 0
    % In this case M is the identity matrix.
    M = eye(size(A));
    
elseif mod(n,2) == 0
    % If n is even, calculate (A*A)^(n/2) using myexpt recursively.
    M = myexpt(A * A,n/2);
    
elseif mod(n,2) == 1
    % If n is odd, calculate A*(A*A^((n-1)/2)) using myexpt recursively.
    M = A * myexpt(A * A,((n-1)/2));
    
else
    % If all goes well, this line should never be reached.
    error("Unexpected Error!");
end

end