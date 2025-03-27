function dlp = DLP(x, d)
    dlp = zeros(1, d+1);
    dlp(1) = x(1);
    
    for s = 2:d+1 
        [~, idx] = max(prod(abs(x - dlp(1:s-1)), 2));
        dlp(s) = x(idx);
    end
end
