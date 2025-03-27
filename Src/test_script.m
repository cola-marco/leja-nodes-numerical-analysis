clc; clear; close all;

N = 1e4;
x = linspace(-1, 1, N)';

degr = 1:50;

times_DLP = zeros(size(degr));
times_DLP2 = zeros(size(degr));

L_values = zeros(size(degr));

errors_leja = zeros(size(degr));
errors_equi = zeros(size(degr));

f = @(x) 1 ./ (x - 1.3);

for d = degr
    tic;
    nodes_leja = DLP(x, d);
    times_DLP(d) = toc;

    tic;
    nodes_leja2 = DLP2(x, d);
    times_DLP2(d) = toc;

    L_values(d) = max(leb_con(nodes_leja, x), [], 'all');

    f_leja = f(nodes_leja);
    p_leja = interp_chebyshev(nodes_leja, f_leja, x);

    nodes_equi = linspace(-1, 1, d+1)';
    f_equi = f(nodes_equi);
    p_equi = interp_chebyshev(nodes_equi, f_equi, x);

    errors_leja(d) = max(abs(p_leja - f(x)));
    errors_equi(d) = max(abs(p_equi - f(x)));
end

figure;
plot(degr, times_DLP, 'r-o', degr, times_DLP2, 'b-o', 'LineWidth', 1.5);
legend('DLP', 'DLP2');
xlabel('Grado del polinomio');
ylabel('Tempo di esecuzione (s)');
title('Confronto dei Tempi Computazionali');
grid on;

figure;
semilogy(degr, L_values, 'b-o', 'LineWidth', 1.5);
xlabel('Grado del polinomio');
ylabel('Costante di Lebesgue');
title('Andamento della Costante di Lebesgue');
grid on;

figure;
semilogy(degr, errors_leja, 'b-o', degr, errors_equi, 'r-o', 'LineWidth', 1.5);
legend('Nodi di Leja', 'Nodi equispaziati');
xlabel('Grado del polinomio');
ylabel('Errore massimo');
title('Confronto Errori di Interpolazione');
grid on;
