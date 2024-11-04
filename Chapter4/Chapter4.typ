#import "@preview/physica:0.9.3": *
#import "@preview/i-figured:0.2.4"

#set heading(numbering: "1.1")
#show math.equation: i-figured.show-equation.with(level: 2)
#show heading: i-figured.reset-counters.with(level: 2)
#set text(font: "CMU Serif")
#let dcases(..args) = math.cases(..args.pos().map(math.display))

#let xbd = $accent(bold(x),dot)$
#let xb = $bold(x)$
#let yb = $bold(y)$
#let Ab = $bold(A)$
#let Bb = $bold(B)$
#let Cb = $bold(C)$
#let ub = $bold(u)$
#let xbtilde = $accent(bold(x),tilde)$
#let Abtilde = $accent(bold(A),tilde)$
#let Bbtilde = $accent(bold(B),tilde)$
#let Cbtilde = $accent(bold(C),tilde)$
#counter(heading).update(3)


= Controllability and Observability of Linear Time Invariant Systems
== Definition of Controllability of Liner Time Invariant Systems
Controllability is a property to determine whether a system can be driven from any initial state to any desired final state in finite time by applying a finite control input.

Given a linear time-invariant state equation:
$
  xbd = bold(A) bold(x) + bold(B) bold(u)
$<state_eq>

*Given any initial state $bold(x)(t_0)$,if there exists a finite time $t_1$ and a admissible control input $bold(u)(t)$ such that the system  can be driven from $bold(x)(t_0)$ to zero($bold(x)(t_1) = bold(0)$),then the system is said to be controllable.*


*Given any initial state $bold(x)(t_0)$,if there exists a finite time $t_1$ and a admissible control input $bold(u)(t)$ such that the system  can be driven from $bold(x)(t_0)$ to any state $bold(x)(t_1)$,then the system is said to be reachable.*

In linear time-invariant systems,controllability and reachability are equivalent.

Proof:
Let us prove the necessity($arrow.double$) of the above theorem.
Given any end state $bold(x)(t_1)$,we do linear transformation as below:
$
  xbtilde(t) = bold(x)(t) - bold(x)(t_1)
$
@eqt:state_eq would be transformed as:
$
  accent(xbtilde,dot)(t) = bold(A)(xbtilde(t) + bold(x)(t_1)) + bold(B) bold(u)(t)
$
We can solve this equation:
$
  accent(bold(x),tilde) (
    t
  )= e^(bold(A) t) xbtilde(t_0) + e^(bold(A) t)integral_(t_0)^t e^(-bold(A) tau) bold(A) bold(x)(
    t_1
  ) dd(tau) + e^(bold(A) t)integral_(t_0)^t e^(-bold(A) tau) bold(B) bold(u)(tau) dd(tau)\
  = e^(bold(A) t)(
    xbtilde(t_0) + integral_(t_0)^t e^(-bold(A)tau) bold(A) bold(x)(t_1) dd(tau)
  )+ integral_(t_0)^t e^(bold(A)(t-tau)) bold(B) bold(u)(tau) dd(tau)
$
Because given any initial state $bold(x)(t_0)$ there exists a finite time $t_1$ and a admissible control input $u(t)$ such that the system can be driven from $bold(x)(t_0)$ to zero($bold(x)(t_1) = 0$),we have:
$
  "let" bold(x)(t_0) = xbtilde(t_0) + integral_(t_0)^t e^(-bold(A)tau) bold(A) bold(x)(t_1) dd(tau),
  exists t, bold(u) ,"such that" \
  xbtilde(t)=e^(bold(A) t)(
    xbtilde(t_0) + integral_(t_0)^t e^(-bold(A)tau) bold(A) bold(x)(t_1) dd(tau)
  )+ integral_(t_0)^t e^(bold(A)(t-tau)) bold(B) bold(u)(tau) dd(tau) = 0
$
Sufficiency($arrow.l.double$) is obvious.

If the system have determined disturbance($bold(f)(t)$) and the disturbance is independent of $bold(u)$,the disturbance will not affect the controllability of the system.
$
  xbd(t) = bold(A) bold(x)(t) + bold(B) bold(u)(t) + bold(f)(t)
$
It is easy to prove similarly as above.

== Criteria of Controllability of Liner Time Invariant Systems
+ System like $xbd (t) = bold(A) bold(x)(t) + bold(B) bold(u)(t)$ is controllable if and only if the $n times n$ gram controllability matrix is full rank.
  $
  bold(W)_c (0,t_1) = integral_0^t_1 e^(-bold(A) tau) bold(B) bold(B)^T e^(-bold(A)^T tau) dd(tau)
  $
  Proof:Let us prove the sufficiency ($arrow.l.double$).We have the following equation:
  $
  bold(x)(t_1) = e^(bold(A) t_1) bold(x)(0) + integral_0^t_1 e^(bold(A)(t_1-tau)) bold(B) bold(u)(tau) dd(tau)\
  = e^(bold(A) t_1)(bold(x)(0) + integral_0^t_1 e^(-bold(A) tau) bold(B) bold(u)(tau) dd(tau))
  $
  To let the system be controllable,we let
  $
  bold(x)(0) + integral_0^t_1 e^(-bold(A) tau) bold(B) bold(u)(tau) dd(tau) = 0
  $
  Because the gram matrix is full rank,we let
  $
  bold(u)(tau) = - bold(B)^T e^(-bold(A)^T tau) bold(W)_c^(-1)(0,t_1) bold(x)(0)
  $
  Thus we have $bold(x)(t_1) = 0$ and the system is controllable.
  
  Let us prove the necessity($arrow.double$).We prove it by contradiction.Suppose the gram matrix is not full rank,then there exists a constant non-zero vector $bold(a)$ such that $bold(a) bold(W)_c (0,t_1) bold(a)^(T) = bold(0)$
  
  Thus we have:
  $
  bold(a) bold(W)_c (0,t_1) bold(a)^(T) = integral_0^t_1 bold(a) e^(-bold(A) tau) bold(B) bold(B)^T e^(-bold(A)^T tau) bold(a)^(T) dd(tau) = bold(0)\
  bold(a)e^(-bold(A) tau) bold(B) = bold(0)
  $
  Let the initial state be $bold(x)(0) = bold(a)^(T)$,then we have:
  $
  bold(x)(t_1) = e^(bold(A) t_1) bold(a)^(T) + integral_0^t_1 e^(bold(A)(t_1-tau)) bold(B) bold(u)(tau) dd(tau)\
  = e^(bold(A) t_1)(bold(a)^(T) + integral_0^t_1 e^(-bold(A) tau) bold(B) bold(u)(tau) dd(tau)) = bold(0)\
  "We have" bold(a)^(T) + integral_0^t_1 e^(-bold(A) tau) bold(B) bold(u)(tau) dd(tau) = bold(0)
  $
  We multiply $bold(a)$ on both sides:
  $
  bold(a)bold(a)^(T) + integral_0^t_1 bold(a) e^(-bold(A) tau) bold(B) bold(u)(tau) dd(tau) = bold(0)\
  "We have" bold(a)bold(a)^(T) = bold(0)
  $
  This is a contradiction,thus the system is controllable.
+ System like $xbd (t) = bold(A)bold(x)(t) + bold(B)bold(u)(t)$ is controllable if and only if the controllability matrix below is full rank.
  $
  bold(Q)_c = mat(delim: "[",bold(B), bold(A)bold(B), bold(A)^2bold(B), dots, bold(A)^(n-1)bold(B))
  $
    Proof:Let $bold(x)(t_1) = 0$ ,we have:
  $
  bold(x)(t_1) = e^(bold(A) t_1) bold(x)(0) + integral_0^t_1 e^(bold(A)(t_1-tau)) bold(B) bold(u)(tau) dd(tau) = 0
  $
  Thus we have:
  $
  bold(x)(0) = -integral_0^t_1 e^(- bold(A)tau) bold(B) bold(u)(tau) dd(tau)
  $
  We use Cayley-Hamilton theorem to get:
  $
  e^(-bold(A) tau) = sum_(i=0)^(n-1) a_i (tau) bold(A)^i
  $
  Thus we have:
  $
  bold(x)(0) = - sum_(i=0)^(n-1)bold(A)^i bold(B) integral_0^t_1 a_i (tau) bold(u)(tau) dd(tau)\
  = mat(delim: "[",bold(B) ,bold(A) bold(B) ,dots,bold(A)^(n-1)bold(B)) mat(delim: "[",-integral_0^t_1 a_0 (tau) bold(u)(tau) dd(tau);
  -integral_0^t_1 a_1 (tau) bold(u) (tau) dd(tau);dots.v;-integral_0^t_1 a_(n-1) (tau) bold(u)(tau) dd(tau))
  $
  From the equation above,we can see that only when $bold(Q)_c$ is full rank,we can get the input $bold(u) (tau)$.
  
+ PBH Criterion.A liner time-invariant system is controllable is equivalent to for all eigenvalues of the system,we have:
  $
  forall lambda_i,rank(mat(delim: "[",lambda_i bold(I)-bold(A),bold(B))) = n
  $
  Proof:Let us prove the necessity($arrow.double$) first.Prove it by contradiction.Suppose $exists lambda_i ,rank(mat(delim: "[",lambda_i bold(I) - bold(A),bold(B))) < n$.Then we have:
  $
  exists bold(a) != bold(0),bold(a) mat(delim: "[",lambda_i bold(I)- bold(A),bold(B))  = bold(0)
  $
  We can get:
  $
  bold(a) bold(A) = lambda_i bold(a),bold(a) bold(B) = bold(0)
  $
  Thus $bold(a)bold(A)^m bold(B)=lambda_i^m bold(a) bold(B) = bold(0)$
  $
  bold(a) mat(delim: "[",bold(B),bold(A)bold(B),dots,bold(A)^(n-1)bold(B)) = bold(0)
  $
  So the matrix $bold(Q)_c$ is not full rank,which is a contradiction.
  
  Let us prove the sufficiency($arrow.l.double$).We prove it by contradiction.Suppose the system is not controllable.

  We transform the system by controllability decomposition:
  $
    accent(xbtilde,dot) = Abtilde xbtilde + Bbtilde u
  $where $Abtilde = bold(P)^(-1)bold(A)bold(P),Bbtilde = bold(P)^(-1)bold(B)$

  Let us prove the sufficiency in this transformed system.The system is also not controllable.And the form of $Abtilde,Bbtilde$ is like:
  $
  Abtilde = mat(delim: "[",Abtilde_(11),Abtilde_(12);bold(0),Abtilde_(22)),Bbtilde = mat(delim: "[",Bbtilde_(1);bold(0))
  $where $Abtilde_(22) != bold(0)$
  Thus we have:
  $
    mat(delim:"[",lambda bold(I) - Abtilde,Bbtilde)=
    mat(delim:"[",lambda bold(I) - Abtilde_(11),-Abtilde_(12),Bbtilde_1;bold(0),lambda bold(I) - Abtilde_(22),bold(0))
  $
  Because $forall lambda_i,det[lambda_i bold(I) - Abtilde] = 0$ in other words $rank(lambda_i bold(I) - Abtilde) != n$.Thus we have:$exists lambda_i$ such that $lambda_i bold(I) - Abtilde_(22)$ is not full rank.Thus $exists lambda_i,rank mat(delim: "[",lambda_i bold(I)-Abtilde,Bbtilde) != n$.So we have a contradiction.

== Definition of Observability of Liner Time Invariant Systems

Given a liner time invariant system:
$
  dcases(
    xbd = Ab xb + Bb ub,
    yb = Cb xb
  )
$<431>
A initial state is said to be observable if the initial state can be determined by the output of the system in a finite time and a given input $u$.A system is said to be observable if all the initial states are observable.

== Criteria of Observability of Liner Time Invariant Systems
+ A system like @eqt:431 is observable if and only if the gram observability matrix is full rank.
  $
  bold(W)_o (0,t_1) = integral_0^t_1 e^(bold(A)^T tau) bold(C)^T bold(C) e^(bold(A) tau) dd(tau)
  $
  Proof:

  We have:
  $
    xb(t) = e^(Ab t)xb(0) + integral_0^t e^(Ab(t-tau))Bb ub(t) dd(tau)
  $<->
  $
    yb = Cb e^(Ab t)xb(0) + integral_0^t Cb e^(Ab(t-tau))Bb ub(t) dd(tau)
  $
  Thus we have:
  $
    Cb e^(Ab t)xb(0) = yb - integral_0^t Cb e^(Ab t) e^(-Ab tau)Bb ub(t) dd(tau)
  $
  We multiply $e^(Ab^T t) Cb^T$ on both sides and integral from 0 to $t_1$:
  $
    integral_0^t_1 e^(Ab^T t) Cb^T Cb e^(Ab t) xb(0) dd(t)
    \ = integral_0^t_1 e^(Ab^T t) Cb^T yb dd(t) - integral_0^t_1 e^(Ab^T t) Cb^T Cb e^(Ab t) integral_0^t e^(-Ab tau)Bb ub(t) dd(tau) dd(t)
  $
  We know that left side is $bold(W)_o xb(0)$ and right side is a known constant matrix.Thus if we want to determine $xb(0)$,we need $bold(W)_o$ to be full rank.Vice versa.
+ A system like @eqt:431 is observable if and only if the observability matrix is full rank.
  $
  bold(Q)_o = mat(delim: "[",Cb;Cb Ab;Cb Ab^2;dots.v;Cb Ab^(n-1))
  $
  Proof:
  We have:
  $
    Cb e^(Ab t)xb(0) = yb - integral_0^t Cb e^(Ab(t-tau))Bb ub(t) dd(tau)
  $
  By Cayley-Hamilton theorem,we have:
  $
    e^(Ab t) = sum_(i=0)^(n-1) a_i (t) Ab^i
  $
  Thus left side of the equation above is:
  $
    Cb sum_(i=0)^(n-1) a_i (t) Ab^i xb(0) = mat(delim: "[",a_0,a_1,dots,a_(n-1)) mat(delim: "[",Cb;Cb Ab;Cb Ab^2;dots.v;Cb Ab^(n-1)) xb(0)
  $
  And right side is a known constant matrix.Thus if we want to determine $xb(0)$,we need $bold(Q)_o$ to be full rank.Vice versa.
+ PBH Criterion.A liner time-invariant system is observable is equivalent to for all eigenvalues of the system,we have:
  $
  forall lambda_i,rank(mat(delim: "[",Cb;lambda_i bold(I)-bold(A))) = n
  $
  Proof:#text(fill: red)[没带笔，下次补，其实跟能控性证明PBH准则的方法一样]

== Duality of Controllability and Observability of Liner Time Invariant Systems
Given a liner time invariant system:
$
  dcases(
    xbd = Ab xb + Bb u,
    yb = Cb xb
  )
$
Its dual system is:
$
  dcases(
    dot(bold(psi)) = Ab^T bold(psi) + Cb^T bold(eta)\
    bold(phi) = Bb^T bold(psi)
  )
$
These two dual systems have two characteristics:
+ Their transfer functions are transposed of each other.
  $
  bold(G)_1(s) = Cb(s I-Ab)^(-1)Bb\
  bold(G)_2(s) = Bb^T (s I-Ab^T)^(-1)Cb^T = bold(G)_1^T (s)
  $
+ Their eigenvalues are the same.
  $
  det(s I-Ab) = det(s I-Ab^T)
  $

*Duality Principle* The controllability of the system is equivalent to the observability of the dual system,and the observability of the system is equivalent to the controllability of the dual system.

== Decomposition by Controllability
Given a liner time invariant system:
$
  dcases(
    xbd = Ab xb + Bb ub,
    yb = Cb xb
  )
$
If the system is not controllable,we can decompose the system into two subsystems:
$
  dcases(
    mat(delim: "[",dot(xbtilde)_1;dot(xbtilde)_2) = mat(delim:"[",Abtilde_11,Abtilde_12;bold(0),Abtilde_22) mat(delim: "[",xbtilde_1;xbtilde_2) + mat(delim: "[",Bbtilde_1;bold(0)) ub\
    yb = mat(delim: "[",Cbtilde_1,Cbtilde_2) mat(delim: "[",xbtilde_1;xbtilde_2)
  )
$
Proof:If the system is not controllable,the controllability matrix is not full rank and we note its rank as $n_1 <n$.
$
  rank(mat(delim: "[",Bb,Ab Bb,Ab^2Bb,dots,Ab^(n-1)Bb)) = n_1 < n
$
We choose a maximal linearly independent columns of the controllability matrix ${beta_1,beta_2,dots,beta_(n_1)}$.It is easy to know that $"span" {beta_1,beta_2,dots,beta_(n_1)} = "span" {Bb,Ab Bb ,dots,Ab^(n-1) Bb}$.And we add $n-n_1$ independent columns to the set ${beta_1,beta_2,dots,beta_(n 1)}$ to get a new set ${beta_1,beta_2,dots,beta_(n_1),beta_(n_1+1),dots,beta_n}$.We have:
$
  Ab mat(delim: "[",beta_1,beta_2,dots,beta_n) = mat(delim: "[",Ab beta_1,Ab beta_2,dots,Ab beta_n) = mat(delim: "[",beta_1,beta_2,dots,beta_n)mat(delim: "[",Abtilde_11,Abtilde_12;bold(0),Abtilde_22) 
$This is because apparently $Ab beta_i in "span" {Bb,Ab Bb,dots,Ab^(n-1) Bb},1<=i<=n_1$,and $A beta_i in "span" {beta_1,beta_2,dots,beta_n},n_1+1<=i<=n$.Thus we only need ${beta_1,beta_2,dots,beta_(n_1)}$ to determine $Ab beta_i,1<=i<=n_1$ in other words $Abtilde_21 = bold(0)$.And $Bb in "span"{Bb,Ab Bb,dots,Ab^(n-1)Bb}$ Thus we have:
$
  bold(P) = mat(delim: "[",beta_1,beta_2,dots,beta_n)^(-1)\
  Abtilde = bold(P)Ab bold(P)^(-1) = mat(delim: "[",Abtilde_11,Abtilde_12;bold(0),Abtilde_22)\
  Bbtilde = bold(P)Bb = mat(delim: "[",Bbtilde_1;bold(0))\
  Cbtilde = Cb bold(P)^(-1) = mat(delim: "[",Cbtilde_1,Cbtilde_2)
$
Thus we have the decomposition of the system.
$
  dcases(
    dot(xbtilde)_1 = Abtilde_11 xbtilde_1 + Abtilde_12 xbtilde_2 + Bbtilde_1 ub\
    dot(xbtilde)_2 = Abtilde_22 xbtilde_2\
    yb = Cb_1 xbtilde_1 + Cb_2 xbtilde_2
  )
$
== Decomposition by Observability
Given a liner time invariant system:
$
  dcases(
    xbd = Ab xb + Bb ub,
    yb = Cb xb
  )
$
If the system is not observable,we can decompose the system into two subsystems:
$
  dcases(
    mat(delim: "[",dot(xbtilde)_1;dot(xbtilde)_2) = mat(delim:"[",Abtilde_11,bold(0);Abtilde_21,Abtilde_22) mat(delim: "[",xbtilde_1;xbtilde_2) + mat(delim: "[",Bbtilde_1;Bbtilde_2) ub\
    yb = mat(delim: "[",Cbtilde_1,bold(0)) mat(delim: "[",xbtilde_1;xbtilde_2)
  )
$
Proof:If a system is not observable,the observability matrix is not full rank and we note its rank as $n_1 <n$.
$
  rank(mat(delim: "[",Cb;Cb Ab;Cb Ab^2;dots.v;Cb Ab^(n-1))) = n_1 < n
$
We choose a maximal linearly independent rows of the observability matrix ${alpha_1,alpha_2,dots,alpha_(n_1)}$.It is easy to know that $"span" {alpha_1,alpha_2,dots,alpha_(n_1)} = "span" {Cb,Cb Ab ,dots,Cb Ab^(n-1)}$.And we add $n-n_1$ independent rows to the set ${alpha_1,alpha_2,dots,alpha_(n 1)}$ to get a new set ${alpha_1,alpha_2,dots,alpha_(n_1),alpha_(n_1+1),dots,alpha_n}$.We have:
$
  mat(delim: "[",alpha_1;alpha_2;dots.v;alpha_n) Ab = mat(delim: "[",alpha_1 Ab;alpha_2 Ab;dots.v;alpha_n Ab) = mat(delim: "[",Abtilde_11,bold(0);Abtilde_21,Abtilde_22) mat(delim: "[",alpha_1;alpha_2;dots.v;alpha_n)
$
Reasoning is similar to the decomposition by controllability,we can get the decomposition of the system.
$
  bold(P) = mat(delim: "[",alpha_1;alpha_2;dots.v;alpha_n)\
  Abtilde = bold(P)Ab bold(P)^(-1) = mat(delim: "[",Abtilde_11,bold(0);Abtilde_21,Abtilde_22)\
  Bbtilde = bold(P)Bb = mat(delim: "[",Bbtilde_1;Bbtilde_2)\
  Cbtilde = Cb bold(P)^(-1) = mat(delim: "[",Cbtilde_1,bold(0))
$
== Controllability Canonical Form
