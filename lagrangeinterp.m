function poly = lagrangeinterp(f, xvals)

syms x

n = length(xvals) - 1;

terms = sym(zeros(n+1,1));

for i = 1:n+1
    % generate lagrange polynomial L(x) of degree n
    factors = sym(ones(n+1,1));  
    for k = 1:n+1
          if k ~= i
              % put each factor of the current coefficient polynomial in a vector (eqn 3.2 - p110)
              factors(k) = (x - xvals(k)) / ( xvals(i) - xvals(k) );
          end
    end
    lnk = prod(factors); % multiply factors together to make a coefficient polynomial (eqn 3.2 - p110)
    term = f(xvals(i))*lnk; % each polynomial is multiplied by a corresponding function value
    
%     fprintf('k=%s : %s\n',num2str(i-1),char(vpa(term,10)))
    terms(i) = term; % each term is a row in the returned vector
end
poly = vpa(expand(sum(terms)),6); % add all terms together to make one expression for L(x)
end
