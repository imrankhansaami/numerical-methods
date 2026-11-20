function root = bisection()
    % Get function from user
    disp('Enter the function');
    func_str = input('f(x) = ', 's');

    % Input interval endpoints
    a = input('Enter left endpoint a: ');
    b = input('Enter right endpoint b: ');

    % Input tolerance and maximum iterations
    tol = input('Enter tolerance (e.g., 0.0001): ');
    max_iter = input('Enter maximum iterations: ');

    % Create function handle
    f = inline(func_str, 'x');

    % Check if there is a root in the interval
    if f(a) * f(b) >= 0
        error('Function must have opposite signs at endpoints')
    end

    % Initialize variables
    iter = 0;
    err = abs(b - a);

    % Main bisection loop
    while err > tol && iter < max_iter
        % Calculate midpoint
        c = (a + b) / 2;

        % Calculate function values
        fa = f(a);
        fc = f(c);

        % Update interval
        if fa * fc < 0
            b = c;
        else
            a = c;
        end

        % Update error and iteration count
        err = abs(b - a);
        iter = iter + 1;

        % Display current iteration results
        fprintf('Iteration %d: x = %.6f, f(x) = %.6f, error = %.6f\n', ...
            iter, c, fc, err);
    end

    % Display final result
    if iter < max_iter
        fprintf('\nRoot found: x = %.6f\n', c);
        fprintf('Function value at root: f(x) = %.6f\n', fc);
        fprintf('Number of iterations: %d\n', iter);
    else
        fprintf('\nMaximum iterations reached. Last approximation: x = %.6f\n', c);
    end

    root = c;
end
