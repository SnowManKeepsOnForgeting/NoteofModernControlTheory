#import "@preview/physica:0.9.3": *
#import "@preview/i-figured:0.2.4"

#set heading(numbering: "1.1")
#show math.equation: i-figured.show-equation.with(level: 2)
#show heading: i-figured.reset-counters.with(level: 2)
#set text(font: "CMU Serif")
#let dcases(..args) = math.cases(..args.pos().map(math.display))

#let xb = $bold(x)$
#let xbh = $accent(bold(x),hat)$
#let xbhd = $dot(hat(bold(x)))$
#let yb = $bold(y)$
#let xbd = $accent(bold(x),dot)$
#let Ab = $bold(A)$
#let Bb = $bold(B)$
#let Cb = $bold(C)$
#let Qb = $bold(Q)$
#let xbtilde = $accent(bold(x),tilde)$
#let Abtilde = $accent(bold(A),tilde)$
#let Bbtilde = $accent(bold(B),tilde)$
#counter(heading).update(5)

= Optimal Control
== Optimal Control Problem
Optimal


== Solving Optimal Control Problems by Variational Methods
Given a functional $J[x(t)]$ of the form,we define the variation of the variable $x$ as
$
  delta x (t)= x(t) - overline(x)(t)
$
If increment of a continuous functional $J[x(t)]$ can be represent as:
$
    Delta J[x(t)] = J[x(t) + delta x(t)] - J[x(t)]\
    = L[x(t),delta x(t)] + r[x(t),delta x(t)]
$
where $L[x(t),delta x(t)]$ is the linear part of the increment of the functional $J[x(t)]$ and $r[x(t),delta x(t)]$ is the higher-order infinitesimal of the increment of $delta x(t)$ in other words $lim_(delta x -> 0)(r[x(t),delta x(t)])/(bar.double delta x(t)bar.double) = 0$.We define the liner part of the functional as the first variation of the functional $J[x(t)]$ and it is denoted by $delta J[x(t)]$.
$
  delta J = L (x(t),delta x(t))
$

*Theory*: A variation of a functional is:
$
  delta J = eval(pdv(,epsilon)J(x+epsilon delta x))_(epsilon = 0)
$
Proof is easy.

*Theory*: Given a starting point $x_0(t_0) = x_0$ and an end point $x_1(t_f) = x_1$ and a functional $J[x(t)]$ 
$
  J[x(t)] = integral_(t_0)^(t_f) L(x,dot(x),t) dd(t)
$Then $x(t)$ is the extremal of the functional when it satisfies the Euler-Lagrange equation:
$
  L_x - dv(,t)L_(dot(x)) = 0
$


