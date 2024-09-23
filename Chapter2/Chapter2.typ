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
  cal(L)[f(t)] = F(s) = integral_0^oo f(t) e^(-s t)  dd(t)
  $<->
  
  $
  cal(L)[k f(t)] = k F(s)
  $<->

  $
  cal(L)[f(t) + g(t)] = F(s) + G(s)
  $ <-> 

  $
  cal(L)[e^( -a t) f(t)] = F(s + a)
  $<->

  $
  cal(L)[e^(a t) f(t)] = F(s - a)
  $<->

  $
  cal(L)[f(t-T)] = e^(-s T) F(s)
  $<->

  $
  cal(L)[f(a t)] = 1/a F(s/a)
  $<->

  $
  cal(L)[dv(f,t)] = s F(s) - f(0)
  $<->

  $
  cal(L)[dv(f,t,2)] = s^2 F(s) - s f(0) - f^'(0)
  $<->

  $
  cal(L)[dv(f,t,n)] = s^n F(s) - s^(n-1) f(0) - s^(n-2) f^'(0) - dots - f^(n-1)(0)
  $<->

  $
  cal(L)[integral_0^t f(t) dd(t)] = F(s)/s
  $<->

  $
  f(oo) = lim_(s -> 0) s F(s)
  $<->

  $
  f(0) = lim_(s -> oo) s F(s)
  $<->
  #table(
    columns: 2, 
    table.header[$f(t)$][$F(s)$],
    [$1$],[$1/s$],
    [$t$],[$1/(s^2)$],
    [$t^n$],[$n!/(s^(n+1))$],
    [$e^(-a t)$],[$s+a$],
    [$sin(omega t)$],[$(omega)/(s^2 + omega^2)$],
    [$cos(omega t)$],[$(s)/(s^2 + omega^2)$],
    [$u(t)$],[$1/s$],
    [$delta(t)$],[$1$]
  )
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

*Closed-loop System*

We have a closed-loop system as figure below:

#figure(image("pic/闭环系统.png", width: 50%), caption: [Closed-loop System])

We have:
$
bold(E)(s) = bold(u)(s) - bold(B)(s)\
bold(B)(s) = bold(H)(s)bold(y)(s) = bold(H)(s)bold(G)(s)bold(E)(s)\
bold(y)(s) = [bold(I) + bold(H)(s)bold(G)(s)]^(-1) bold(G)(s)bold(u)(s) 
$<->

Thus the transfer function of closed-loop system is:
$
bold(G)_bold(H)(s) =[bold(I) + bold(H)(s)bold(G)(s)]^(-1) bold(G)(s)
$

*Regular*

We say a transfer function is regular if and only if when 
$
lim_(s -> oo) g(s) = c
$where c is a constant.
And a transfer function is strictly regular if and only if when
$
lim_(s -> oo) g(s) = 0
$
== Establishing State Space Model by Differential Equation

Given a single input and single output system,if we have differential equation as:
$
y^((n)) + a_(n-1) y^((n-1)) + a_(n-2) y^((n-2)) + dots + a_0 y = b_n u^((n)) + b_(n-1) u^((n-1)) + dots + b_0 u
$<differential_equation>
where $m<=n$.

*Condition 1: $m = 0$*

We have:
$
y^((n)) + a_(n-1) y^((n-1)) + a_(n-2) y^((n-2)) + dots + a_0 y = b_0 u
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
  accent(x,dot)_n = -a_0 x_1 - a_1 x_2 - dots - a_(n-1) x_n + b_0u
)
$
We can rewrite it as vector form:
$
bold(accent(x,dot)) = mat(delim: "[",
0,1,dots,0;
dots.v,dots.v,dots.down,dots.v;
0,0,dots,1;
-a_0,-a_1,dots,-a_(n-1)
) bold(x) + mat(delim: "[",0;0;dots.v;b_0) \
y = mat(delim: "[",1,0,dots,0) bold(x)
  
$

*Condition 2:*$m eq.not n$

*Controllable Canonical Form Method:*

Let us note D as $dv(,t)$,we can rewrite @eqt:differential_equation as:
$
y = (b_m D^m + b_(m-1) D^(m-1) + b_(m-2) D^(m-2) + dots + b_0)/(D^n + a_(n-1) D^(n-1) + a_(n-2) D^(n-2) + dots +a_0) u
$<differential_equation_divide>
Let us discuss the case when $m<n$

Let
$ 
accent(y,tilde)^((n)) + a_(n-1) accent(y,tilde)^((n-1)) + a_(n-2) accent(y,tilde)^((n-2)) + dots + a_1 accent(y,tilde)^((1)) + a_0 accent(y,tilde) = u
$ Also as 
$
accent(y,tilde) =1/(D^n + a_(n-1) D^(n-1) + a_(n-2) D^(n-2) + dots +a_0) u 
$

we can get:
$
y = b_m accent(y,tilde)^((m)) + b_(m-1) accent(y,tilde)^((m-1)) + b_(m-2) accent(y,tilde)^((m-2)) + dots + b_0 accent(y,tilde)
$
We choose state variables as $x_1 = accent(y,tilde),x_2 = accent(y,tilde)^((1)) ,dots,x_n = accent(y,tilde)^((n-1)) $.We can get state equation as:
$
cases(
  accent(x,dot)_1 = x_2,
  accent(x,dot)_2 = x_3,
  dots.v,
  accent(x,dot)_(n-1) = x_n,
  accent(x,dot)_n = -a_0 x_1 - a_1 x_2 - dots - a_(n-1) x_n + u
)
$
and output equation as:
$
y = b_0 x_1 + b_(1) x_2 + dots + b_m x_(m+1)
$
We can rewrite it as vector form:
$
bold(accent(x,dot)) = mat(delim: "[",
0,1,dots,0;
dots.v,dots.v,dots.down,dots.v;
0,0,dots,1;
-a_0,-a_1,dots,-a_(n-1)
) bold(x) + mat(delim: "[",0;0;dots.v;1)u \
y = [b_0,dots,b_m,0,dots,0] bold(x)
$
Let us discuss the case when $m=n$,we can rewrite @eqt:differential_equation_divide as:
$
y = [b_n + ((b_(n-1)-b_n a_(n-1))D^(n-1) + dots + (b_0 - b_n a_0))/(D^n +a_(n-1) D^(n-1) + dots + a_0)] u
$
Also let 
$
accent(y,tilde)^((n)) + a_(n-1) accent(y,tilde)^((n-1)) + a_(n-2) accent(y,tilde)^((n-2)) + dots + a_1 accent(y,tilde)^((1)) + a_0 accent(y,tilde) = u
$
We can get:
$
y = (b_(n-1) -b_n a_(n-1))accent(y,tilde)^((n-1)) + (b_(n-2) - b_n a_(n-2))accent(y,tilde)^((n-2)) + dots + (b_0 - b_n a_0)accent(y,tilde) + b_n u
$

Thus we can write state equation in vector form in familiar way as:
$
bold(accent(x,dot)) = mat(delim: "[",
0,1,dots,0;
dots.v,dots.v,dots.down,dots.v;
0,0,dots,1;
-a_0,-a_1,dots,-a_(n-1)
) bold(x) + mat(delim: "[",0;0;dots.v;1)u \
y = [b_0 - b_n a_0,b_1 - b_n a_1,dots,b_(n-1) - b_n a_(n-1)] bold(x) + b_n u
$
*Undetermined Canonical Form Method:*
W.l.o.g,we assume that the equation is in the form of:
$
y^((n)) + a_(n-1) y^((n-1))  + dots + a_0 y = b_n u^((n)) + b_(n-1) u^((n-1)) + dots + b_0 u
$<wlog_diffeq>
We can define state variables as:
$
cases(
  x_1 &= y - beta_0 u\
  x_2 &= accent(x,dot)_1 - beta_1 u = accent(y,dot) - beta_0 accent(u,dot) - beta_1 u\
  x_3 &= accent(x,dot)_2 - beta_2 u = accent(y,dot.double) - beta_0 accent(u,dot.double) - beta_1 accent(u,dot) - beta_2 u\
  &dots.v\
  x_n &= accent(x,dot)_(n-1)-beta_(n-1)u = y^((n-1)) - beta_0 u^((n-1)) - beta_1 u^((n-2)) - dots - beta_(n-1) u
)
$
Thus we have:
$
cases(
  y = x_1 + beta_0 u\
  accent(y,dot) = x_2 + beta_0 accent(u,dot) + beta_1 u\
  accent(y,dot.double) = x_3 + beta_0 accent(u,dot.double) + beta_1 accent(u,dot) + beta_2 u\
  #h(1em) dots.v\
  y^((n-1)) = x_n + beta_0 u^((n-1)) + beta_1 u^((n-2)) + dots + beta_(n-1) u
)
$
Let us introduce a new variables $x_(n+1) = accent(x,dot)_n - beta_n u =accent(x,dot)_(n-1)-beta_(n-1)u = y^((n)) - beta_0 u^((n)) - beta_1 u^((n-1)) - dots - beta_(n) u $.Thus we have:
$
y^((n)) = x_(n+1) + beta_0 u^((n)) + beta_1 u^((n-1)) + dots + beta_(n) u
$
Substitute $y,accent(y,dot),dots,y^((n))$ into @eqt:wlog_diffeq,we can get:
$
(x_(n+1) + a_(n-1) x_n + dots + a_0 x_1) + beta_0 u^((n)) + (beta_1 + a_(n-1) beta_0)u^((n-1)) + \ (beta_2 + a_(n-1) beta_1 + a_(n-2) beta_0)u^((n-2)) + dots + (beta_n + a_(n-1) beta_(n-1) + a_(n-2) beta_(n-2) + dots + a_0 beta_0)u \ = b_n u^((n)) + b_(n-1) u^((n-1)) + b_(n-2) u^((n-2)) + dots + b_0 u
$
Compare the coefficients of $u^((n)),u^((n-1)),dots,u$,we can get:
$
cases(
  x_(n+1) + a_(n-1) x_n + dots + a_0 x_1 &= 0\
  beta_0 &= b_n\
  beta_1 + a_(n-1) beta_0 &= b_(n-1)\
  beta_2 + a_(n-1) beta_1 + a_(n-2) beta_0 &= b_(n-2)\
  #h(7em) dots.v\
  beta_n + a_(n-1) beta_(n-1) + a_(n-2) beta_(n-2) + dots + a_0 beta_0 &= b_0
)
$
In summary,we can get state equation as:
$
cases(
  accent(x,dot)_1 = accent(y,dot) - beta_0 accent(u,dot) = x_2 + beta_1 u \
  accent(x,dot)_2 = accent(y,dot.double) - beta_0 accent(u,dot.double) - beta_1 accent(u,dot) = x_3 + beta_2 u\
  #h(1.5em) dots.v\
  accent(x,dot)_(n-1) = y^((n-1)) - beta_0 u^((n-1)) - beta_1 u^((n-2)) - dots - beta_(n-2) accent(u,dot) = x_n + beta_(n-1)u \
  accent(x,dot)_n = y^((n)) - beta_0 u^((n)) - beta_1 u^((n-1)) - dots - beta_(n-1) accent(u,dot) = -a_0 x_1 - a_1 x_2 - dots - a_(n-1) x_n + beta_n u
)
$
and output equation as:
$
y = x_1 + beta_0 u
$
We can rewrite it as vector form:
$
vec(delim: "[",
  accent(x,dot)_1,accent(x,dot)_2,dots.v,accent(x,dot)_n
  ) = mat(delim: "[",
  0,1,0,dots,0;
  0,0,1,dots,0;
  dots.v,dots.v,dots.v,dots.down,dots.v;
  0,0,0,dots,1;
  -a_0,-a_1,-a_2,dots,-a_(n-1)
) vec(delim: "[",
  x_1,x_2,dots.v,x_n
  ) + 
  vec(delim: "[",
  beta_1,beta_2,dots.v,beta_n
  )u\
y = [1,0,0,dots,0] vec(delim: "[",
  x_1,x_2,dots.v,x_n
  ) + beta_0 u
$
== Establishing State Space Model by Transfer Function
For a actual physical system,the transfer function of the system is always regular.

First,let us discuss the situation where the system is restrict regular in other words order of numerator of the transfer function is less than denominator of the transfer function.If we have a differential equation of system as:
$
y^((n)) + a_(n-1)y^((n-1)) + a_(n-2)y^((n-2)) + dots + a_1 accent(y,dot) + a_0 y = b_(n-1) u^((n-1)) + dots + b_1 accent(u,dot) + b_0 u
$
Then we have transfer function as:
$
g(s) = (Y(s))/(U(s)) = (b_(n-1) s^(n-1) + b_(n-2) s^(n-2) + dots + b_0)/(s^n + a_(n-1) s^(n-1)+ dots + a_1 s+a_0)
$
Introduce a intermediate variables $Z(s)$
We have:
$
g(s) = Y(s)/Z(s) Z(s)/U(s) =  (b_(n-1) s^(n-1) + b_(n-2) s^(n-2) + dots + b_0) /1 1/(s^n + a_(n-1) s^(n-1)+ dots + a_(1)s+a_0)
$

Let us do inverse Laplace transform of $Z(s)$,we can get:
$
cases(
 y = b_(n-1) z^((n-1)) + b_(n-2) z^((n-2)) + dots + b_1 accent(z,dot) + b_0 z    \

 z^((n)) + a_(n-1) z^((n-1)) + a_(n-2) z^((n-2)) + dots + a_1 accent(z,dot) + a_0 z= u\
 
)
$
We can define state variables as $x_1 = z,x_2 = accent(z,dot),x_3 = accent(z,dot.double),x_n = z^((n-1))$.We have state equation as:
$
cases(
  accent(x,dot)_1 = x_2,
  accent(x,dot)_2 = x_3,
  dots.v,
  accent(x,dot)_(n-1) = x_n,
  accent(x,dot)_n = -a_0 x_1 - a_1 x_2 - dots - a_(n-1) x_n + u 
)
$
And output equation as:
$
y = b_0 x_1 + b_1 x_2 + dots + b_(n-1) x_n
$

Let us discuss when the order of numerator of transfer function is as same as order of denominator of transfer function.We have transfer function as:
$
g(s) = (Y(s))/(U(s)) = (b_n s^n + b_(n-1) s^(n-1) + dots + b_0)/(s^n + a_(n-1) s^(n-1)+ dots + a_1 s+a_0)\
= b_n + ((b_(n-1) - b_n a_(n-1)) s^(n-1) + (b_(n-2) - b_n a_(n-2)) s^(n-2) + dots + (b_0 - b_n a_0))/(s^n + a_(n-1) s^(n-1)+ dots + a_1 s+a_0)
$

Let us note $h(s)$ as intermediate transfer function:
$
h(s) = (beta_(n-1)s^(n-1) + beta_(n-2)s^(n-2) + dots + beta_0)/(s^n + a_(n-1) s^(n-1)+ dots + a_1 s+a_0)
$
where $beta_i = b_i - b_n a_i$ for $i = 0,1,dots,n-1$.
We do the same thing as before,we can get:
$
cases(
 y = beta_(n-1) z^((n-1)) + beta_(n-2) z^((n-2)) + dots + beta_1 accent(z,dot) + beta_0 z    \

 z^((n)) + a_(n-1) z^((n-1)) + a_(n-2) z^((n-2)) + dots + a_1 accent(z,dot) + a_0 z= u\
 
)
$
And
$
cases(
  accent(x,dot)_1 = x_2,
  accent(x,dot)_2 = x_3,
  dots.v,
  accent(x,dot)_(n-1) = x_n,
  accent(x,dot)_n = -a_0 x_1 - a_1 x_2 - dots - a_(n-1) x_n + u 
)
$
For output equation,all we need is to add a $b_n u$ term.
$
y = beta_0 x_1 + beta_1 x_2 + dots + beta_(n-1) x_n + b_n u
$
== Linear Transformation
Given a state variable vector $bold(x)$,the linear combination of the state variable vector is also a state variable vector $accent(bold(x),macron)$ if and only if the linear transformation matrix $bold(P)$ is invertible.
$
bold(x) = bold(P) accent(bold(x),macron)
$
In other words:
$
accent(bold(x),macron) = bold(P)^(-1) bold(x)
$