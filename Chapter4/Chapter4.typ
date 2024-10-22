#import "@preview/physica:0.9.3": *
#import "@preview/i-figured:0.2.4"

#set heading(numbering: "1.1")
#show math.equation: i-figured.show-equation.with(level: 2)
#show heading: i-figured.reset-counters.with(level: 2)
#set text(font: "CMU Serif")

#let xbd = $accent(bold(x),dot)$
#let xbtilde = $accent(bold(x),tilde)$
#let Abtilde = $accent(bold(A),tilde)$
#let Bbtilde = $accent(bold(B),tilde)$
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
+ System like $xbd (t) = bold(A) bold(x)(t) + bold(B) bold(u)(t)$ is controllable if and only if the $n times n$ gram matrix is full rank.
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
  Proof:Let us prove the sufficiency($arrow.l.double$).We prove it by contradiction.Suppose the system is not controllable in other words the gram matrix is not full rank,then there exists a constant non-zero vector $bold(a)$ such that $bold(a) bold(W)_c (0,t_1)bold(a)^(T) = bold(0)$.We have:
  $
  bold(a) e^(-bold(A) tau) bold(B)= bold(0),tau in [0,t_1]
  $
  Because $forall tau in [0,t_1]$ the equation above holds,we have:
  $
  bold(a)bold(B) = bold(0)
  $
  And do differentiation on both sides to $tau$,we have:
  $
  cases(
    bold(a)bold(B) = bold(0),
    bold(a)bold(A)bold(B) = bold(0),
    bold(a)bold(A)^2bold(B) = bold(0),
    #h(1em)dots.v,
    bold(a)bold(A)^(n-1)bold(B) = bold(0)
  )
  $
  #text(fill: red)[then we have $bold(Q_c)$ is not full rank,which is a contradiction.(Because we have non-zero solution of homogeneous equations).to be continued...]

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



