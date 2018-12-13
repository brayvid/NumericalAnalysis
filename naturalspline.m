function poly = naturalspline(data)
n = length(data) - 1;

x = zeros(n+1,1);
a = zeros(n+1,1);
b = zeros(n,1);
c = zeros(n+1,1);
d = zeros(n,1);

for i = 1:n+1
    x(i) = data(i, 1);
    a(i) = data(i, 2); 
end

h = zeros(n, 1);

for i = 1:n
    hi = x(i+1) - x(i);
    h(i) = hi;
end

alpha = zeros(n-1, 1);

for i = 1:n-1
    alphi = 3*(a(i+2) - a(i+1))/h(i+1) - 3*(a(i+1) - a(i))/h(i);
    alpha(i) = alphi;
end

l = zeros(n+1,1);
mu = zeros(n+1,1);
z = zeros(n+1,1);

l(1) = 1;
mu(1) = 0;
z(1) = 0;

for i = 2:n
    li = 2*(x(i+1) - x(i-1)) - h(i-1)*mu(i-1);
    l(i) = li;
    
    mui = h(i)/l(i);
    mu(i) = mui;
    
    zi = (alpha(i-1)-h(i-1)*z(i-1))/l(i);
    z(i) = zi;
end


l(n+1) = 1;
z(n+1) = 0;
c(n+1) = 0;

for j = n:-1:1
    
    cj = z(j) - mu(j)*c(j+1);
    c(j) = cj;

    bj = (a(j+1) - a(j))/h(j) - h(j)*(c(j+1)+2*c(j))/3;
    b(j) = bj;
   
    dj = (c(j+1) - c(j))/(3*h(j));
    d(j) = dj;

end

abcd = [a(1:n) b(1:n) c(1:n) d(1:n)];

syms x

num_intervals = length(data) - 1;

pieces = sym(zeros(num_intervals,1));
for i = 1:num_intervals
    pieces(i) = abcd(i,1) + abcd(i,2)*(x - data(i,1)) + abcd(i,3)*(x - data(i,1))^2 + abcd(i,4)*(x - data(i,1))^3;
end

poly = vpa(expand(pieces),6);

end