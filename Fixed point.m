% Fixed-Point Iteration Method
% Solves x = g(x) by iterating x_{k+1} = g(x_k) until |x_{k+1} - x_k| < tolerance.
% Running this script executes the three example cases below; edit g and x0 to
% try your own iteration. The fixedPoint function itself is defined at the end.

% Example 1: g(x) = sqrt(2 + x) -- converges to the fixed point x = 2
g = @(x) sqrt(2 + x); % Example function: x = sqrt(2 + x)
x0 = 1; % Initial guess
tolerance = 1e-6;
maxIterations = 100;

[root, iterations] = fixedPoint(g, x0, tolerance, maxIterations);

fprintf('Fixed Point: %f\n', root);
fprintf('Iterations: %d\n', iterations);


% Example 2: g(x) = x^2 -- converges to the fixed point x = 0 from x0 = 0.5
g2 = @(x) x^2;
x0_2 = 0.5;
[root2, iterations2] = fixedPoint(g2, x0_2, tolerance, maxIterations);

fprintf('Fixed Point of g2: %f\n', root2);
fprintf('Iterations for g2: %d\n', iterations2);


% Example 3: g(x) = 3x + 2 -- diverges
g3 = @(x) 3*x+2;
x0_3 = 1;
[root3, iterations3] = fixedPoint(g3, x0_3, tolerance, maxIterations);
fprintf('Fixed Point of g3: %f\n', root3);
fprintf('Iterations for g3: %d\n', iterations3);


% Local function (must be at the end of the script)
function [root, iterations] = fixedPoint(g, x0, tolerance, maxIterations)
    iterations = 0;
    x = x0;
    prev_x = Inf; % Initialize prev_x for convergence check

    while iterations < maxIterations
        iterations = iterations + 1;

        next_x = g(x);

        % Check for convergence (improved)
        if abs(next_x - x) < tolerance || abs(next_x - prev_x) < tolerance
            root = next_x;
            return;
        end

        prev_x = x; % Store the previous value of x
        x = next_x;
    end

    root = x; % Return the last calculated value if max iterations reached
    warning('Maximum number of iterations reached. Solution may not have converged.');
end
