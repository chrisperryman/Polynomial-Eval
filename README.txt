Christopher Perryman - cp877@bath.ac.uk

THREE TOP LEVEL FUNCTIONS:

Simple.m - Takes two arguments (a,x) in that order, where a is a 3D array storing the coefficients of the polynomial, and x is 
	   the associated x-value (which ought to be a compatible matrix). Returns the value of the polynomial, executing Horners Rule.

Sparse.m - Takes three arguments (index,b,x) in that order, where index is a row vector storing the exponents, b is a 3D array 
	   storing the coefficients of the polynomial and x is the associated x-value (which ought to be a compatible matrix).
	   Returns the value of the polynomial, again using Horners rule, but it doesn't calculate the coefficients that are not
	   in the index, making it more efficient for evaluating more sparsely populated polynomials.

Faster.m - Identical to Sparse.m but it keeps a record of previously computed x^k values rather than recomputing them each time.
	   We only store values for k less than or equal to 100.

SUBFUNCTIONS:

myexpt.m - Is called by Sparse.m. Takes two arguments (A, n) in that order, where A is a square matrix, and n an exponent. 
	   It evaluates the matrix M = A^n without using the built-in MatLab power function.

myexptFaster.m - Is called by Faster.m. Takes two arguments (A, n) in that order, where A is a square matrix, and n an exponent.
		 It evaluates the matrix M = A^n without using the built-in MatLab power function. Then stores it in a global 
		 variable, and if it can, will use this stored value again, rather than recalculating it each time.

ErrorChecker.m - Is called by Sparse.m and Faster.m. Takes three arguments (index,b,x) in that order, and runs checks on the three inputs
		 to confirm that no errors will be thrown in either of the parent functions. This function is called at the start of each
		 parent function and if an error is thrown, it is descriptive of the error type such that it can be rectified.

ErrorCheckerSimple.m - Is called by Simple.m. Takes two arguments (a,x) in that order, and runs checks on the two inputs
		       to confirm that no errors will be thrown in the parent function Simple.m. This function is called at the start of 
		       Simple.m and if an error is thrown, it is descriptive of the error type such that it can be rectified.


