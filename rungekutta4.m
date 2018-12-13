function TBL = rungekutta4(f, a, b, n, y0)
h = (b - a)/n;

% Set up columns, need rows = #intervals + 1
t = zeros(n+1,1);
w = zeros(n+1,1);
dw = zeros(n+1,1);

% Initial condition
t(1) = a;
w(1) = y0;
dw(1) = f(t(1), w(1));

% Calculate subsequent rows based on preceding value of t
for i=2:n+1
    
    % calc dydt
    
    % calc all k for this step
    k = zeros(4, 1);
    k(1) = h * dw(i-1);
    for j = 2:3
        k(j) = h * f(t(i-1) + (h/2), w(i-1) + (k(j-1)/2));
    end
    k(4) = h * f(t(i-1) + h, w(i-1) + k(3));
    
    % calc next t
    t(i) = a + (i-1)*h;
    
    % calc next y
    w(i) = w(i-1) + (k(1) + 2*k(2) + 2*k(3) + k(4))/6;
    
    % calc next dydt
    dw(i) = f(t(i), w(i));
    
end

arr = [t w dw];
cols = {'t','y','dydt'};
TBL = array2table(arr,'VariableNames',cols);

end