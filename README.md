# Numerical Methods (MATLAB)

A collection of classic **root-finding methods** — numerical algorithms for solving equations of the form *f(x) = 0* — implemented in MATLAB as part of my numerical methods coursework.

Each script is self-contained, needs no toolboxes, and prints its iteration history and final result when run.

## Contents

| Method | File | How you give it the equation | Convergence |
| --- | --- | --- | --- |
| Bisection | [`bisection.m`](bisection.m) | Interactive prompts: f(x), interval [a, b], tolerance, max iterations | Linear; guaranteed when f has opposite signs at a and b |
| Fixed-point iteration | [`Fixed point.m`](Fixed%20point.m) | Edit `g` and `x0` in the example section at the top of the file | Linear; converges when \|g′(x)\| < 1 near the fixed point |
| Newton–Raphson | [`Newton Raphson Method.m`](Newton%20Raphson%20Method.m) | Edit `f`, `df` and `x0` at the top of the script | Quadratic near the root |
| Regula Falsi (false position) | [`Regula Falsi Method.m`](Regula%20Falsi%20Method.m) | Interactive prompts: f(x) and max iterations (interval [2, 3] and tolerance 1e-4 are set in the script) | Linear; keeps the sign change, usually faster than bisection |
| Secant | [`Secant Method.m`](Secant%20Method.m) | Edit `f`, `x0` and `x1` at the top of the script | Superlinear; no derivative needed |

## Iteration formulas

- **Bisection**: $c = \frac{a + b}{2}$ — the midpoint of the current interval, keeping the half where the sign changes.
- **Fixed-point iteration**: $x_{k+1} = g(x_k)$ — converges when $|g'(x)| < 1$ near the fixed point.
- **Newton–Raphson**: $x_{k+1} = x_k - \frac{f(x_k)}{f'(x_k)}$ — follows the tangent line at the current point.
- **Regula Falsi**: $c = b - \frac{f(b)\,(b - a)}{f(b) - f(a)}$ — where the secant line through the interval endpoints crosses zero.
- **Secant**: $x_{k+1} = x_k - \frac{f(x_k)\,(x_k - x_{k-1})}{f(x_k) - f(x_{k-1})}$ — a derivative-free Newton step using the last two points.

## Requirements

- MATLAB (any recent release). No toolboxes or helper files are needed.

## Running the scripts

Open the folder in MATLAB and press **Run** (or F5) on a file:

- **bisection.m** — type `bisection` in the Command Window, then answer the prompts for the function, endpoints, tolerance and maximum iterations.
- **Fixed point.m** — press Run; the three example iterations execute (converging to 2, converging to 0, and one that diverges). Edit the `g`/`x0` values to try your own.
- **Newton Raphson Method.m** — press Run to solve `x^2 - 4 = 0` from `x0 = 3`; edit the function, derivative and initial guess at the top for a different problem.
- **Secant Method.m** — press Run to solve `x^3 - 5*x + 1 = 0` from `x0 = 1`, `x1 = 3`; edit the values at the top for a different problem.
- **Regula Falsi Method.m** — press Run, then enter the function as a text expression (e.g. `x^3 - 2*x - 5`) and the maximum number of iterations. `^` is converted to `.^` automatically, so element-wise notation is not required.

Each script stops when the tolerance is met or the maximum number of iterations is reached, and reports the outcome (including when it fails to converge).
