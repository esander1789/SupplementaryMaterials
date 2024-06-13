function newt=secant(sol,s,p0) 
% Secant method to find the time when the length of a curve is a given value
% Input: sol = ode solution, values can be found at any time
%        s = required curve length
%        p0 = initial guess
N=500; tol=1.0e-11; % N is maximum number of steps, tol is error bound 
i=2; y=deval(sol,p0);  % i is function eval count, y is solution at time p0
q0=y(4)-s; % first function value
p1=p0+1e-4; y=deval(sol,p1); q1=y(4)-s; % second function value
while i<=N && abs(p0-p1)>tol
  p=p1-q1*(p1-p0)/(q1-q0); % secant step and update
  i=i+1; p0=p1; q0=q1; p1=p; y=deval(sol,p1); q1=y(4)-s; 
end
if abs(p-p0)>tol, error('no convergence'); end 
newt=p;
