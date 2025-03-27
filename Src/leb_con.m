function L = leb_con(z, x)
    n = length(z);
    L_vals = zeros(size(x));

    for i = 1:n
        Li = prod((x - z([1:i-1, i+1:n])) ./ (z(i) - z([1:i-1, i+1:n])), 2);
        L_vals = L_vals + abs(Li);
    end

    L = max(L_vals);
end
