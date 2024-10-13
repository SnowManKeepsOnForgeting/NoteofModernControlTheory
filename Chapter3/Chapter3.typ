#import "@preview/physica:0.9.3": *
#import "@preview/i-figured:0.2.4"

#set heading(numbering: "1.1")
#show math.equation: i-figured.show-equation.with(level: 2)
#show heading: i-figured.reset-counters.with(level: 2)

#set text(font: "CMU Serif")
#let xbd = $accent(bold(x),dot)$
#counter(heading).update(2)
= Solution of State Equations
== Solution of Liner Time Invariant Homogeneous State Equations
Given a liner time invariant homogeneous state equation:
$
  accent(bold(x),dot)(t) = bold(A) bold(x)(t)
$
If the input is zero and $t_0 = 0$,it is easy to see that the solution is:
$
  bold(x) = e^(bold(A)t )bold(x)(0)
$
If the $t_0 != 0$, the solution is:
$
  bold(x)(t) = e^(bold(A)(t-t_0))bold(x)(t_0)
$
We call $e^(bold(A)(t-t_0))$ as matrix exponential or state transition matrix and note it as $Phi(t)$.
== Matrix Exponential
*Definition*:
$
  e^(bold(A)t) = bold(I) + bold(A)t + bold(A)^2 t^2 / 2! + bold(A)^3 t^3 / 3! + dots
$

(1)
$
  dv(,t)e^(bold(A)t) = bold(A) e^(bold(A)t) = e^(bold(A)t)bold(A)\
  dv(,t)Phi(t) = bold(A)Phi(t) = Phi(t)bold(A)
$
(2)
$
  e^(bold(A) dot 0) = bold(I)\
  Phi(0) = bold(I)
$
(3)
$
  [e^(bold(A) t)]^(-1) = e^(-bold(A)t)\
  [Phi(t)]^(-1) = Phi^(-1)(t)=Phi(-t)
$
(4)
$
  e^(bold(A)(t_2-t_0))e^(bold(A)(t_0-t_1)) = e^(bold(A)(t_2-t_1))
$
(5)If and only if $bold(A) bold(B) = bold(B) bold(A)$
$
  e^((bold(A) + bold(B))t) = e^(bold(A)t)e^(bold(B)t)
$

*Some special matrix exponential:*

(1) Diagonal matrix:It is easy to see that:
$
  A = diag(lambda_1,lambda_2,...,lambda_n)\
  e^(bold(A)t) = diag(e^(lambda_1 t),e^(lambda_2 t),...,e^(lambda_n t))
$
(2) Jordan block matrix:
$
  A = mat(delim: "[",lambda,1,,,,0;,lambda,dots.down;,,dots.down,;,,,,lambda,1;
0,,,,,lambda)\
$
We have:
$
  bold(A)^2 = mat(delim: "[",lambda^2,2 lambda,1,,0;
,lambda^2,2 lambda,dots.down;,,lambda^2,dots.down;
;,,,,dots.down),bold(A)^3 = mat(delim: "[",lambda^3,3 lambda^2,3lambda,1,,,,0;
,lambda^3,3 lambda^2,dots.down;,,lambda^3,dots.down;
;,,,,dots.down)
$
We can induct that:
$
  bold(f)(
    bold(A)
  ) = mat(delim: "[",f(lambda),f^'(lambda),(f^('')(lambda)) / (2!),(f^(''')(lambda)) / (3!),dots,dots;
,f(lambda),f^'(lambda),(f^('')(lambda)) / (2!),dots,dots;
,,dots.down,dots.down;
,,,,dots.down)
$where $bold(f)$ stands for a power function.

Let us plus them by definition of matrix exponential:
$
  e^(bold(A)t) = e^(lambda t)mat(delim: "[" ,1,t,t^2 / 2!,t^3 / 3!,dots,t^(m-1)/(m-1)!;
,1,t,t^2 / 2!,dots,t^(m-2)/(m-2)!;
,,dots.down,dots.down,,dots.v;
,,,,,1)
$
(3) Jordan form matrix
Let $bold(A)$ be a matrix with Jordan form:
$
  bold(A) = mat(delim: "[",bold(A)_1,bold(0),dots,bold(0);
bold(0),bold(A)_2,dots,bold(0);
dots.v,dots.v,dots.down,dots.v;
bold(0),bold(0),dots,bold(A)_n)
$where $bold(A)_i$ is a Jordan block matrix.
We have:
$
  e^(bold(A)t) = mat(delim: "[",e^(bold(A)_1 t),bold(0),dots,bold(0);
bold(0),e^(bold(A)_2 t),dots,bold(0);
dots.v,dots.v,dots.down,dots.v;
bold(0),bold(0),dots,e^(bold(A)_n t))
$
*Method of Calculate Matrix Exponential*

(1) *Laplace transformation method*

Let us consider a liner time invariant homogeneous state equation:
$
  accent(bold(x),dot)(t) = bold(A) bold(x)(t),bold(x)(0) = bold(x)_0,t >= t_0
$
We do laplace transformation on both sides:
$
  s bold(X)(s) - bold(x)(0)= bold(A) bold(X)(s)
$
We can get:
$
  bold(x)(t) = cal(L)^(-1)[(s bold(I) - bold(A))^(-1)]bold(x)(0)
$
By uniqueness of solution of differential equation, we can get:
$
  e^(bold(A)t ) = cal(L)^(-1)[(s bold(I) - bold(A))^(-1)]
$
(2) *Polynomial method*

Cayley-Hamilton theorem tells us that:If matrix $bold(A)$ is a $n times n$ square matrix, then:
$
  f(lambda) = det(lambda bold(I) - bold(A)) = lambda^n + a_1 lambda^(n-1) + a_2 lambda^(n-2) + dots + a_n = 0
$

$
  f(bold(A)) = bold(A)^n + a_1 bold(A)^(n-1) + a_2 bold(A)^(n-2) + dots + a_n bold(I) = bold(0)
$
By Cayley-Hamilton theorem, we get that $bold(A)^(n)$ is actually a linear combination of $bold(A)^(n-1),bold(A)^(n-2),dots,bold(I)$.It is similar to $bold(A)^(n+1),bold(A)^(n+2),dots$ which means we can write $e^(bold(A)t)$ as a linear combination of $bold(I),bold(A),bold(A)^2,dots,bold(A)^(n-1)$.

When *eigenvalues of $bold(A)$ are all different*,let us consider the following equation to get $e^(lambda t)$($e^(bold(A)t)$ and $e^(lambda t)$ should have the same coefficient $a_i (t)$):
$
  cases(
  e^(lambda_1 t) = a_0(t) + a_1(t) lambda_1 + a_2(t) lambda_1^2 + dots + a_(n-2)(t) lambda_1^(n-2) + a_(n-1)(t) lambda_1^(n-1)\
  e^(lambda_2 t) = a_0(t) + a_1(t) lambda_2 + a_2(t) lambda_2^2 + dots + a_(n-2)(t) lambda_2^(n-2) + a_(n-1)(t) lambda_2^(n-1)\
  #h(2em) dots.v\
  e^(lambda_n t) = a_0(t) + a_1(t) lambda_n + a_2(t) lambda_n^2 + dots + a_(n-2)(t) lambda_n^(n-2) + a_(n-1)(t) lambda_n^(n-1)
)
$
Thus we have:
$
  vec(delim: "[",a_0(t),a_1(t),dots.v,a_(n-1)(t)) = mat(
  delim: "[",
  1,lambda_1,lambda_1^2,dots,lambda_1^(n-1);
  1,lambda_2,lambda_2^2,dots,lambda_2^(n-1);
  dots.v,dots.v,dots.v,dots.down,dots.v;
  1,lambda_n,lambda_n^2,dots,lambda_n^(n-1)
)^(-1) vec(delim: "[",e^(lambda_1 t),e^(lambda_2 t),dots.v,e^(lambda_n t))
$

When *eigenvalues of $bold(A)$ are not all different*,let us consider the following equation to get $e^(lambda t)$.We still have:
$
  cases(
  e^(lambda_1 t) = a_0(t) + a_1(t) lambda_1 + a_2(t) lambda_1^2 + dots + a_(n-2)(t) lambda_1^(n-2) + a_(n-1)(t) lambda_1^(n-1)\
  e^(lambda_2 t) = a_0(t) + a_1(t) lambda_2 + a_2(t) lambda_2^2 + dots + a_(n-2)(t) lambda_2^(n-2) + a_(n-1)(t) lambda_2^(n-1)\
  #h(2em) dots.v\
  e^(lambda_m t) = a_0(t) + a_1(t) lambda_m + a_2(t) lambda_m^2 + dots + a_(n-2)(t) lambda_m^(n-2) + a_(n-1)(t) lambda_m^(n-1)
)
$where $m < n$.To get more equations to get $a_i$,we do differential on both sides of $e^(lambda_i t) $ to $lambda_i$ until $(n-1)$ times.For example,we have a n-fold eigenvalue $lambda_k$:
$
  cases(
  e^(lambda_k t) = a_0(t) + a_1(t) lambda_k + a_2(t) lambda_k^2 + dots + a_(n-2)(t) lambda_k^(n-2) + a_(n-1)(t) lambda_k^(n-1)\
  (lambda_k)/(1!) e^(lambda_k t) = a_1(t) + 2 a_2(t) lambda_k + dots + (n-1) a_(n-1)(t) lambda_k^(n-2)\
  lambda_k^2/(2!) e^(lambda_k t) =  a_2(t) + 3 a_3(t) lambda_k + dots + ((n-1)(n-2))/(2!) a_(n-1)(t) lambda_k^(n-3)\
  #h(2em)dots.v\
  lambda_k^(n-1)/(n-1)! e^(lambda_k t) = a_(n-1)(t)
)
$
Thus we have enough equations to get $a_i (t)$ for example.
$
  cases(
  e^(lambda_1 t) = a_0(t) + a_1(t) lambda_1 + a_2(t) lambda_1^2 + dots + a_(n-2)(t) lambda_1^(n-2) + a_(n-1)(t) lambda_1^(n-1)\
    lambda_1/(1!) e^(lambda_1 t) = a_1(t) + 2 a_2(t) lambda_1 + dots + (n-1) a_(n-1)(t) lambda_1^(n-2)\
    lambda_1^2/(2!) e^(lambda_1 t) = a_2(t) + 3 a_3(t) lambda_1 + dots + ((n-1)(n-2))/(2!) a_(n-1)(t) lambda_1^(n-3)\


  e^(lambda_2 t) = a_0(t) + a_1(t) lambda_2 + a_2(t) lambda_2^2 + dots + a_(n-2)(t) lambda_2^(n-2) + a_(n-1)(t) lambda_2^(n-1)\
    lambda_2/(1!) e^(lambda_2 t) = a_1(t) + 2 a_2(t) lambda_2 + dots + (n-1) a_(n-1)(t) lambda_2^(n-2)\
e^(lambda_3 t) = a_0(t) + a_1(t) lambda_3 + a_2(t) lambda_3^2 + dots + a_(n-2)(t) lambda_3^(n-2) + a_(n-1)(t) lambda_3^(n-1)\

  #h(2em) dots.v\
  e^(lambda_m t) = a_0(t) + a_1(t) lambda_m + a_2(t) lambda_m^2 + dots + a_(n-2)(t) lambda_m^(n-2) + a_(n-1)(t) lambda_m^(n-1)

)
$
We can write it as matrix form for example:
$
  vec(delim: "[",a_0(t),a_1(t),a_2(t),a_3(t),a_4(t),dots.v,a_(n-1)(t)) =
  mat(delim: "[", 0,0,1,3lambda_1,dots,((n-1)(n-2))/(2!)lambda_1^(n-3);
 0,1,2lambda_1,3lambda^2,dots,((n-1))/(1!)lambda_1^(n-2);
  1,lambda_1,lambda_1^2,lambda^3,dots,lambda_1^(n-1);
  0,1,2lambda_2,3lambda_2^2,dots,((n-1))/(1!)lambda_2^(n-2);
  1,lambda_2,lambda_2^2,lambda_2^3,dots,lambda_2^(n-1);
  1,lambda_3,lambda_3^2,lambda_3^3,dots,lambda_3^(n-1);
  dots.v,dots.v,dots.v,dots.v,dots,dots.v;
  1,lambda_m,lambda_m^2,lambda_m^3,dots,lambda_m^(n-1)
)^(-1) vec(delim: "[",1/(2!) t^2 e^(lambda_1 t),1/(1!) t e^(lambda_1 t),e^(lambda_1 t),1/(1!) t e^(lambda_2 t),e^(lambda_2 t),e^(lambda_3 t),dots.v,e^(lambda_m t))
$

(3) *Liner transformation method*

*If matrix $bold(A)$ can be transformed to a diagonal matrix($Lambda = bold(P) bold(A) bold(P)^(-1)$),in other words,all eigenvalues are different*,we can get $e^(bold(A)t)$ easily by the following equation:
$
  e^(bold(A)t) = bold(I) + bold(A)t + 1 / (2!) bold(A)^2 t^2 + 1 / 3! bold(A)^3 t^3 + dots \
  = bold(I) + bold(P)^(-1)Lambda bold(P)t + 1 / 2! bold(P)^(-1)Lambda bold(P) bold(P)^(-1)Lambda bold(P)t^2 + 1 / 3! bold(P)^(-1)Lambda bold(P) bold(P)^(-1)Lambda bold(P) bold(P)^(-1)Lambda bold(P)t^3 + dots\
  = bold(I) + bold(P)^(-1)Lambda bold(P)t + 1 / 2! bold(P)^(-1)Lambda^2 bold(P)t^2 + 1 / 3! bold(P)^(-1)Lambda^3 bold(P)t^3 + dots\
  = bold(P)^(-1) (bold(I) + bold(Lambda)t + 1 / 2! bold(Lambda)^2 t^2 + 1 / 3! bold(Lambda)^3 t^3 + dots) bold(P)\
  = bold(P)^(-1) e^(Lambda t) bold(P)
$
*If matrix $bold(A)$ can't be transformed to a diagonal matrix,in other words,some eigenvalues are the same*,we can use Jordan form matrix to get $e^(bold(A)t)$.We have $bold(J) = bold(P) bold(A) bold(P)^(-1)$ where $bold(J)$ is a Jordan form matrix.

We have
$
  e^(bold(A)t) = bold(P)^(-1) e^(bold(J)t) bold(P)
$

*If matrix $bold(A)$ have complex eigenvalues*,we can use the following equation to get $e^(bold(A)t)$.The eigenvalues of $bold(A)$ are $lambda_1 = alpha + beta i$ and $lambda_2 = alpha - beta i$.We have:
$
  bold(M) = bold(P) bold(A) bold(P)^(-1) = mat(delim: "[",alpha,beta;-beta,alpha)\
$
And
$
  e^(bold(M) t) = e^(mat(delim: "[",alpha,0;0,alpha)t) e^(mat(delim: "[",0,beta;-beta,0)t)
$
where
$
  e^(mat(delim: "[",alpha,0;0,alpha)t) = mat(delim: "[",e^(alpha t),0;0,e^(alpha t))\
  e^(mat(delim: "[",0,beta;-beta,0)t) = mat(delim: "[",cos(beta t),sin(beta t);-sin(beta t),cos(beta t))
$
Thus we have:
$
  e^(bold(A) t) = bold(P)^(-1) e^(bold(M)t)bold(P)
$

== Solution of Liner Time Invariant Nonhomogeneous State Equations
Given a liner time invariant nonhomogeneous state equation:
$
  #xbd (t) = bold(A)bold(x)(t) + bold(B)bold(u)(t)
$
We can conduct the following steps to get the solution:
$
  #xbd (t) - bold(A)bold(x)(t) = bold(B)bold(u)(t)\
e^(-bold(A)t) #xbd (t) - e^(-bold(A)t)bold(A)bold(x)(t) = e^(-bold(A)t)bold(B)bold(u)(t)\
dv(,t)(e^(-bold(A)t)bold(x)(t)) = e^(-bold(A)t)bold(B)bold(u)(t)\
$
Thus we do intergration on both sides from $0$ to $t$:
$
  e^(-bold(A)t)bold(x)(t) |_(0)^(t) = integral_(0)^(t) e^(-bold(A)tau)bold(B)bold(u)(tau) dd(tau)
$
So we have:
$
  bold(x)(t) = e^(bold(A)t)bold(x)(0) + integral_(0)^(t) e^(bold(A)(t-tau))bold(B)bold(u)(tau) dd(tau)
$
Or we can write it as:
$
  bold(x)(t) = Phi(t)bold(x)(0) + integral_(0)^(t) Phi(t-tau)bold(B)bold(u)(tau) dd(tau)
$
And it is easy to see output is:
$
  bold(y)(t) = bold(C)bold(x)(t) + bold(D)bold(u)(t)\
  = bold(C) e^(bold(A)t)bold(x)(0) + bold(C) integral_(0)^(t) e^(bold(A)(t-tau))bold(B)bold(u)(
    tau
  ) dd(tau) + bold(D)bold(u)(t)
$