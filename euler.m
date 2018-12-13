function TBL = euler(f, a, b, n, y0)
h = (b-a)/n;

t = zeros(n+1,1);
t(1) = a;

w = zeros(n+1,1);
w(1) = y0;

dw = zeros(n+1,1);
dw(1) = f(a,y0);

for i = 2:n+1
    dw(i) = f(t(i-1), w(i-1));
    w(i) = w(i-1) + h*dw(i);
    t(i) = a + (i-1)*h;
end
arr = [t w dw];
cols = {'t','y','dydt'};
TBL = array2table(arr,'VariableNames',cols);
end