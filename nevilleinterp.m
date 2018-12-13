function poly = nevilleinterp(nodes)
    syms x;
    n = length(nodes) - 1;
    Q = sym(zeros(n+1, n+1));
    for i = 1:n+1
        Q(i, 1) = nodes(i,2); % insert function values as first column of Q
    end
    
    for i = 2:n+1
        for j = 2:i % create each additional element of Q
            qij = ((x - nodes(i-j+1,1))*Q(i,j-1) - (x - nodes(i,1))*Q(i-1,j-1))/(nodes(i,1) - nodes(i-j+1,1));
            Q(i,j) = qij;
        end
    end
    poly = vpa(expand(Q(end,end)),6);
end