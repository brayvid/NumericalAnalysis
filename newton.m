
function TBL = newton(f, x0, tol, max)

syms x

df = diff(f(x),x);
df = @(x)subs(df);

w = [x0 (x0-(f(x0)/df(x0)))];

n = 2;

while (n<max && abs(w(end) - w(end-1)) >= tol) 
    xnew = vpa((w(n) - (f(w(n))/df(w(n)))),10);
    w = [w xnew];
    n = n+1;
end

w = vpa(w', 8);
arr = double([(0:length(w)-1)' w]);
cols = {'n','p_n'};
TBL = array2table(arr,'VariableNames',cols);

end