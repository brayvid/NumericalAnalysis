
function TBL = bisect(f, a, b, n, tol)

fa = f(a);

ind = 1;

P = [];

while ind <= n
   mpt = (b-a)/2;
   p = a + mpt;
   fp = f(p);
   P = [P p];
   
   if fp == 0 || mpt < tol
       break
   end
   
   ind = ind + 1;
   
   if fa*fp > 0
       a = p;
   else
       b = p;
   end
   
end
indices = (1:length(P))';
approximations = [indices P'];
cols = {'n','p_n'};
TBL = array2table(approximations,'VariableNames',cols);
end