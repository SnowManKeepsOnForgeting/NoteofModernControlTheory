#import "@preview/physica:0.9.3": *
#import "@preview/i-figured:0.2.4"

#set heading(numbering: "1.1")
#show math.equation: i-figured.show-equation.with(level: 2)
#show heading: i-figured.reset-counters.with(level: 2)

#counter(heading).update(1)
= Description of State Space
== Definition
1. *Input variables*
We usually use $bold(u)_t = mat(delim: "[",u_1(t);u_2(t);dots.v;u_n(t))$ to represent input variables.

2. *State variables*
We usually use $bold(x)_t = mat(delim: "[",x_1(t);x_2(t);dots.v;x_n(t))$ to represent state variables.It is a least set to describe state of system. 

3. *Output variables*
We usually use $bold(y)_t = mat(delim: "[",y_1(t);y_2(t);dots.v;y_n(t))$ to represent output variables.

4. *State equation*
State equation is a first order differential equation that describe relationship between input variables and state variables. We can write it as:
$
cases(accent(x,dot)_1 &= f_1(x_1,x_2,dots,x_n;u_1,u_2,dots,u_p,t),
accent(x,dot)_2 &= f_2(x_1,x_2,dots,x_n;u_1,u_2,dots,u_p,t),
&dots.v,
accent(x,dot)_n &= f_n (x_1,x_2,dots,x_n;u_1,u_2,dots,u_p,t))
$

Rewrite it as vector form:
$
bold(accent(x,dot))_t = bold(f)(bold(x)_t,bold(u)_t,t)
$
5. *Output equation*
Output equation is a equation that describe relationship between state variables and output variables. We can write it as:
$
cases(
  y_1 &= g_1(x_1,x_2,dots,x_n;u_1,u_2,dots,u_p,t),
  y_2 &= g_2(x_1,x_2,dots,x_n;u_1,u_2,dots,u_p,t),
  &dots.v,
  y_n &= g_n (x_1,x_2,dots,x_n;u_1,u_2,dots,u_p,t)
)
$

Rewrite it as vector form:
$
bold(y)_t = bold(g)(bold(x)_t,bold(u)_t,t)
$

6. *Description of State space of System*
We can describe state space of system by equations as:
$
cases(
  bold(accent(x,dot))_t &= bold(f)(bold(x)_t,bold(u)_t,t),
  bold(y)_t &= bold(g)(bold(x)_t,bold(u)_t,t)
)
$

When the system is linear, we can write it as:
$
cases(
  bold(accent(x,dot)) &= bold(A)(t)bold(x) + bold(B)(t)bold(u),
  bold(y) &= bold(C)(t)bold(x) + bold(D)(t)bold(u)
)
$

== Transfer function
Transfer function is a function that describe relationship between input and output of system.Given a system with different state,the transfer function is still the same which means it is not related to state of system in other words state variables.

*Single input -- Single output system*

Given a linear single input-single output system,we have state space representation as:
$
cases(
  bold(accent(x,dot)) &= bold(A)bold(x) + bold(B) u,
  y &= bold(C)bold(x) + D u
)
$
To get transfer function,we can use Laplace transform to get:
$
s bold(X) - bold(x)(0) = bold(A)bold(X) + bold(B) U(s)\
Y(s) = bold(C)bold(X)(s) + D U(s)
$<->

#set align(center)
#block(
  fill: luma(230),
  inset: 8pt,
  radius: 4pt
)[
  *Laplace transfer*:
  
  $
  cal(L)[a f(t) + b g(t)] = a cal(L)[f(t)] + b cal(L)[g(t)]
  $<->

  $
  cal(L)[f^(n)(t)] = s^n cal(L)[f(t)] - s^{n-1} f(0) - s^{n-2} f^{(1)}(0) - dots - f^{(n-1)}(0)
  $<->

  $
  cal(L)[integral_0^t dd(t) integral_0^t dd(t) dots integral_0^t f(t) dd(t)] = 1/s^n cal(L)[f(t)]
  $<->

  To be continued...
]
#set align(left)

The equations are organized as follows:
$
bold(X)(s) = (s bold(I) - bold(A))^(-1) [bold(x)(0) + bold(B) U(s)]\
Y(s) = bold(C)(s bold(I) - bold(A))^(-1) [bold(x)(0) + bold(B) U(s)] + D U(s)
$<->
Let initial condition be zero($bold(x)(0) = 0$),we can get:
$
Y(s) = [bold(C)(s bold(I) - bold(A))^(-1) bold(B) + D] U(s)
$<->

Thus,we can get transfer function as:
$
g(s) = Y(s)/U(s) = bold(C)(s bold(I) - bold(A))^(-1) bold(B) + D
$

Let $D = 0$,we can get:
$
g(s) = (bold(C) "adj"(s bold(I) - bold(A)) bold(B))/(det(s bold(I) - bold(A)))
$

*Multi input -- Multi output system*

Given a multi input-multi output system,we define transfer function between i-th out $y_i$ and j-th input $u_j$ as:
$
g_(i j)(s) = (Y_i (s))/(U_j (s))
$
where $Y_i (s)$ is Laplace transform of $y_i (t)$ and $U_j (s)$ is Laplace transform of $u_j (t)$.
Must mention that if we define transfer function in this way,we assume that all other inputs are zero.Because linear system satisfies the principle of superposition,so when we plus all inputs $U_1,U_2,dots,U_p$,we can get the i-th output $Y_i$ as:
$
Y_i = sum_(j=1)^p g_(i j) U_j
$
We can write it as matrix form:
$
bold(Y)(s) = bold(G)(s) bold(U)(s)
$

Thus given a linear multi input-multi output system,we have state space representation as:
$
cases(
  bold(accent(x,dot)) &= bold(A)bold(x) + bold(B)bold(u),
  bold(y) &= bold(C)bold(x) + bold(D)bold(u)
)
$
We can conduct as before to get transfer function as:
$
bold(G)(s) = bold(C)(s bold(I) - bold(A))^(-1) bold(B) + bold(D) = (bold(C) "adj"(s bold(I) - bold(A)) bold(B) + bold(D) "det"(s bold(I) - bold(A)))/(det(s bold(I) - bold(A)))
$

== Establishing State Space Model by Differential Equation

Given a single input and single output system,if we have differential equation as:
$
y^((n)) + a_1 y^((n-1)) + a_2 y^((n-2)) + dots + a_n y = b_0 u + b_1 u^((1)) + b_2 u^((2)) + dots + b_m u^((m))
$<differential_equation>
where $m<=n$.

*Condition 1: $m = 0$*
let $b_0 = 1$,we have:
$
y^((n)) + a_1 y^((n-1)) + a_2 y^((n-2)) + dots + a_n y = b_0 u + b_1 u^((1)) + b_2 u^((2)) + dots + b_m u^((m))
$
We can define state variables as:
$
cases(
  x_1 &= y,
  x_2 &= y^((1)),
  x_3 &= y^((2)),
  &dots.v,
  x_n &= y^((n-1))
)
$
We can get state equation as:
$
cases(
  accent(x,dot)_1 = x_2,
  accent(x,dot)_2 = x_3,
  dots.v,
  accent(x,dot)_(n-1) = x_n,
  accent(x,dot)_n = -a_1 x_n - a_2 x_(n-1) - dots - a_n x_1 + b_0 u
)
$
We can rewrite it as vector form:
$
bold(accent(x,dot)) = mat(delim: "[",
0,1,dots,0;
dots.v,dots.v,dots.down,dots.v;
0,0,dots,1;
-a_n,-a_(n-1),dots,-a_1
) bold(x) + mat(delim: "[",0;0;dots.v;1) \
y = mat(delim: "[",1,0,dots,0) bold(x)
  
$

*Condition 2:*$m eq.not n$

*Controllable Canonical Form Method:*

Let us note D as $dv(,t)$,we can rewrite @eqt:differential_equation as:
$
y = (b_0 D^m + b_1 D^(m-1) + b_2 D^(m-2) + dots + b_m)/(D^n + a_1 D^(n-1) + a_2 D^(n-2) + dots +a_n) u
$<differential_equation_divide>
Let us discuss the case when $m<n$

let $accent(y,tilde)^((n)) + a_1 accent(y,tilde)^((n-1)) + a_2 accent(y,tilde)^((n-2)) + dots + a_(n-1) accent(y,tilde)^((1)) + a_n accent(y,tilde) = u$ also as $accent(y,tilde) =1/(D^n + a_1 D^(n-1) + a_2 D^(n-2) + dots +a_n) u$

we can get:
$
y = b_0 accent(y,tilde)^((m)) + b_1 accent(y,tilde)^((m-1)) + b_2 accent(y,tilde)^((m-2)) + dots + b_m accent(y,tilde)
$
We choose state variables as $x_1 = accent(y,tilde),x_2 = accent(y,tilde)^((1)) ,dots,x_n = accent(y,tilde)^((n-1)) $.We can get state equation as:
$
cases(
  accent(x,dot)_1 = x_2,
  accent(x,dot)_2 = x_3,
  dots.v,
  accent(x,dot)_(n-1) = x_n,
  accent(x,dot)_n = -a_n x_1 - a_(n-1) x_2 - dots - a_1 x_n + u
)
$
and output equation as:
$
y = b_m x_1 + b_(m-1) x_2 + dots + b_0 x_(m+1)
$
We can rewrite it as vector form:
$
bold(accent(x,dot)) = mat(delim: "[",
0,1,dots,0;
dots.v,dots.v,dots.down,dots.v;
0,0,dots,1;
-a_n,-a_(n-1),dots,-a_1
) bold(x) + mat(delim: "[",0;0;dots.v;1)u \
y = [b_m,dots,b_0,0,dots,0] bold(x)
$
Let us discuss the case when $m=n$,we can rewrite @eqt:differential_equation_divide as:
$
y = [b_0 + ((b_1-b_0a_1)D^(n-1) + dots + (b_n - b_0 a_n))/(D^n +a_1 D^(n-1) + dots + a_n)] u
$
Also let $accent(y,tilde)^((n)) + a_1 accent(y,tilde)^((n-1)) + a_2 accent(y,tilde)^((n-2)) + dots + a_(n-1) accent(y,tilde)^((1)) + a_n accent(y,tilde) = u$
We can get:
$
y = (b_n -b_0 a_n)accent(y,tilde)^((n-1)) + (b_(n-1) - b_0 a_(n-2))accent(y,tilde)^((n-2)) + dots + (b_1 - b_0 a_1)accent(y,tilde) + b_0 u
$

Thus we can write state equation in vector form in familiar way as:
$
bold(accent(x,dot)) = mat(delim: "[",
0,1,dots,0;
dots.v,dots.v,dots.down,dots.v;
0,0,dots,1;
-a_n,-a_(n-1),dots,-a_1
) bold(x) + mat(delim: "[",0;0;dots.v;1)u \
y = [b_n - b_0 a_n,b_(n-1) - b_0 a_(n-1),dots,b_1 - b_0 a_1] bold(x) + b_0 u
$




