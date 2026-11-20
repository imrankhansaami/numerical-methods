f = @(x) x^3 - 5*x + 1;
x0 = 1;
x1 = 3;
tol = 1e-4;
n = 20;

for i = 1:n
    x2 = x1 - (f(x1) * (x1 - x0)) / (f(x1) - f(x0));
    fprintf('Iteration %d: x = %.6f, f(x) = %.6f\n', i, x2, f(x2));

    if abs(x2 - x1) < tol
        fprintf('Root found: %.6f after %d iterations.\n', x2, i);
        break;
    end

    x0 = x1;
    x1 = x2;
end

if abs(x2 - x1) >= tol
    fprintf('Did not converge within %d iterations.\n', n);
end

