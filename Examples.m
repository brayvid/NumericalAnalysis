% Numerical analysis algorithms
% Examples of how to run them
clc


% Bisection method
clear

% Edit
func = @(x) 2*x^3-3;
a = 1;
b = 2;
max_n = 15;
error = 1e-3;

% Output
fprintf('Bisection method\n')
bisect(func, a, b, max_n, error)



% Fixed-point iteration
clear

% Edit
func = @(w) (w^3 + 1)/2;
p0 = 0.4;
tol = 0.008;
max = 20;

% Output
fprintf('Fixed-point iteration\n')
fixedpoint(func, p0, tol, max)



% Newton's method
clear

% Edit
func = @(x) exp(x) + x^3 - 5;
p0 = 1;
error = 0.00001;
max_n = 10;

% Output
fprintf('Newton''s method\n')
newton(func, p0, error, max_n)



% Lagrange interpolation
clear

% Edit
f = @(x) log(x);
xvals = [1 2 3 4];

% Output
fprintf('Lagrange interpolation\n')
lagrangeinterp(f,xvals)



% Natural cubic spline interpolation
clear

% Edit
data = [-0.4 -0.02618; -0.2 0.35616; 0 0.98867]; % each row [X Y]

% Output
fprintf('Natural cubic spline interpolation\n')
naturalspline(data)



% Neville interpolation
clear

% Edit
data = [-0.2, 0.7; 0, 0.85; 0.3, 0.67]; % each row [X Y]

% Output
fprintf('Neville''s interpolation\n')
nevilleinterp(data)



% Jacobi Iteration, approximate solution x of Ax=b given A and b
clear

% Edit
A = [10 -1 2 0; -1 11 -1 3; 2 -1 10 -1; 0 3 -1 8];
b = [6 25 -11 15]';
x0 = [0;0;0;0];
N = 200;
tol =10^-5;

% Output
fprintf('Jacobi Iteration:\n')
jacobi(A,b,x0,N,tol)



% Euler's Method
clear

% Edit
f = @(t,y) 1 + (y/t);
a = 1;
b = 1.45;
n = 3;
y0 = 4;

% Output
fprintf('Euler''s Method\n')
euler(f, a, b, n, y0)



% Runge-Kutta 4th order
clear

% Edit
f = @(t,y) 1+(t-y)^2; % f = dydt
a = 1;
b = 1.4;
n = 10;
y0 = 2;

% Output
fprintf('Runge-Kutta 4th order\n')
rungekutta4(f, a, b, n, y0)