function dlp = DLP2(x, d)
    V = cos((0:d)' * acos(x'));
    [~, ~, P] = lu(V, 'vector');
    dlp = x(P(1:d+1));
end