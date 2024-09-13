#import "@preview/physica:0.9.3": *
#import "@preview/i-figured:0.2.4"

#set heading(numbering: "1.1")
#show math.equation: i-figured.show-equation.with(level: 2)
#show heading: i-figured.reset-counters.with(level: 2)

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

Given a single input-single output,we have state space representation as:
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
