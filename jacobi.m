function x = jacobi(A,b,x0,N,tol)
N = N+1; % include a zeroth column
n = size(A,1); % number of equations
x = zeros(n, N); % kth column will be the kth iterated solution
x(:,1) = x0; % set first column of x to be x0
k = 2; % jacobi iterator. x(k=1) is x0

% iterate to find x(k=2:max)
while k <= N
    
    for i = 1:n % determine each element in the kth x vector
        
        % compute summation
        sumterms = 0;
        for j = 1:n
            if j ~= i
                sumterms = sumterms + (A(i,j)*x0(j));
            end
        end
        
        x(i,k) = (1 / A(i,i)) * (b(i)  - sumterms);
    end
    
    if (norm(x(:,k) - x(:,k-1),Inf) / norm(x(:,k),Inf)) < tol
        % success
        break
    elseif k==N
        % failure
        fprintf('Failure to meet tolerance.')
        break
    else
        % continue
        x0 = x(:,k);
        k = k + 1;
    end 
end
x = x(:,k); % trim extra zeros from end
end