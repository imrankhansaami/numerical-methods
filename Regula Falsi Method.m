% Regula Falsi Method with User Input and Predefined a, b, and Tolerance

% Get the function from the user
func_str = input('Enter the function (e.g., x^3 - 2*x - 5): ', 's');

% Replace ^ with .^ for element-wise power
func_str = strrep(func_str, '^', '.^');

try
    f = str2func(['@(x) ' func_str]); % Convert string to function handle
catch ME
    fprintf('Error: %s\n', ME.message); % Print detailed error message
    error('Invalid function input. Please enter a valid MATLAB expression.');
end

% Predefined interval and tolerance
a = 2;        % Left endpoint
b = 3;        % Right endpoint
tolerance = 1e-4; % Tolerance

% Get maximum iterations from the user
maxIterations = input('Enter the maximum number of iterations: ');


% Check if the interval is valid (AFTER defining a and b)
if f(a) * f(b) >= 0
    error('Function values at endpoints must have opposite signs for the given interval.');
end

iterations = 0;
prev_root = Inf;

% Main loop
while iterations < maxIterations
    iterations = iterations + 1;

    c = b - (f(b) * (b - a)) / (f(b) - f(a));

    % Check for convergence
    if abs(c - prev_root) < tolerance || abs(f(c)) < tolerance
        root = c;
        fprintf('Root: %f\n', root);
        fprintf('Iterations: %d\n', iterations);
        return;
    end

    % Update the interval
    if f(c) == 0
        root = c;
        fprintf('Root: %f\n', root);
        fprintf('Iterations: %d\n', iterations);
        return;
    elseif f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
    prev_root = c;
end

root = c;
fprintf('Root: %f\n', root);
fprintf('Iterations: %d\n', iterations);
warning('Maximum number of iterations reached. Solution may not have converged.');
