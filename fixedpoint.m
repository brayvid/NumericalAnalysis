function TBL = fixedpoint(g, p0, tol, max)

ind = 1;

p = 0;

P = [];

while ind <= max
    p = g(p0);
    
    P = [P p];
    
    if abs(p - p0) < tol
        break
    end
    
    ind = ind + 1;
    p0 = p;
end

indices = 1:length(P);
iterations = [indices' P'];
cols = {'n','pn'};
TBL = array2table(iterations,'VariableNames',cols);

end