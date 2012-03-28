function y = fak(n)
if n < 0 | fix(n) ~= n,
    error('FAK ist nur für positive ganze Zahlen definiert')
end
if n <= 1,
    y = 1;
else
    y = n*fak(n-1);
end