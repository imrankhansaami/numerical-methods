f = @(x) x^2 - 4;        % Function definition
df = @(x) 2 * x;         % Derivative of the function
x0 = 3;                  % Initial guess
tol = 1e-4;              % Tolerance for convergence
n = 20;                  % Maximum number of iterations

% Newton-Raphson Iteration
for i = 1:n
    x1 = x0 - f(x0) / df(x0);  % Compute next approximation
    fprintf('Iteration %d: x = %.6f, f(x) = %.6f\n', i, x1, f(x1));

    % Check for convergence
    if abs(x1 - x0) < tol
        fprintf('Root found: %.6f after %d iterations.\n', x1, i);
        break;
    end

    x0 = x1;  % Update for the next iteration
end

% If no convergence after max iterations
if abs(x1 - x0) >= tol
    fprintf('Did not converge within %d iterations.\n', n);
end

