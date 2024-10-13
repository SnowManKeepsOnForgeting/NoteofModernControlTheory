#import "@preview/physica:0.9.3":*
#import "@preview/i-figured:0.2.4"

#let xb = $bold(x)$
#let xbd = $accent(bold(x),dot)$
#let xbl = $accent(bold(x),macron)$
#let yb = $bold(y)$
#let ub = $bold(u)$
#let Qb = $bold(Q)$
#let Abl = $accent(bold(A),macron)$
#let Bbl = $accent(bold(B),macron)$


+ Determine the observability of the following systems:

  (1) $xbd = mat(delim: "[",1,1;1,0)xb,y = mat(delim: "[",1,1)xb$

  (2) $xbd = mat(delim: "[",0,4,3;0,20,16;0,-25,-20)xb,y = mat(delim: "[",-1,3,0)xb$

  (3) $xbd = mat(delim: "[",-4,0,0;0,-4,0;0,0,1)xb,y = mat(delim: "[",1,1,4)xb$

  Solution:(1)We use Kalman's observability criterion to determine the observability of the system.
  $
  Qb_o = mat(delim: "[",bold(C);bold(C A)) = mat(delim: "[",1,1;2,1)\
  rank(Qb_o) = 2=n
  $
  Thus the system is observable.

  (2)We use Kalman's observability criterion to determine the observability of the system.
  $
  Qb_o = mat(delim: "[",bold(C);bold(C A);bold(C A^2)) = mat(delim: "[",-1,3,0;0,56,45;0,-5,-4)\
  rank(Qb_o) = 3=n
  $
  Thus the system is observable.

  (3)The matrix $bold(A)$ is in diagonal form.Thus if matrix $bold(C)$ does not have a zero column,then the system is observable.By this criterion the system is observable.

+ Try to determine for which values of $p,q$ the following systems are not controllable and for which values they are not observable.
  $
  
  xbd = mat(delim: "[",1,12;1,0)xb + mat(delim: "[",p;-1)u \ y = mat(delim: "[",q,1)xb
  $

  Solution:By Kalman's criterion,we have:
  $
  Qb_c = mat(delim: "[",bold(B),bold(A)bold(B)) = mat(delim: "[",p,p-12;-1,p)\
  Qb_o = mat(delim: "[",bold(C);bold(C A)) = mat(delim: "[",q,1;q+1,12q)\
  "let" det(Qb_c) = p^2+p - 12 = 0,p=-4,3\
  "let" det(Qb_o) = 12q^2 - q - 1 = 0,q=- 1/4,1/3
  $
  Thus the system is not controllable for $p=-4,3$ and not observable for $q=-1/4,1/3$.

+ Try to prove the following system is not controllable in any condition of $a,b,c$.
  $
  xbd = mat(delim: "[",20,-1,0;4,16,0;12,0,18)xb + mat(delim: "[",a;b;c)u
  $
  Solution:We calculate the eigenvalues of the matrix $bold(A)$.
  $
  "let" det(lambda bold(I) - bold(A)) = - (lambda - 18)^3 = 0\
  lambda_(1,2,3) = 18
  $
  We apply jordan transformation to system.
  We have:
  $
  "Let" Abl = bold(P) bold(A) bold(P)^(-1) = mat(delim: "[",18,1,0;0,18,1;0,0,18)\
  bold(P) = mat(delim: "[",0,-1/8,1/24;0,1/4,0;1,-1/2,0)\
  Bbl = bold(P) bold(B) = mat(delim: "[",-1/8 b + 1/24 c;1/4 b;a - 1/2 b)\
  accent(bold(x),macron) = bold(P) bold(x)
  $
  Thus we have:
  $
  accent(accent(bold(x),macron),dot) = mat(delim: "[",18,1,0;0,18,1;0,0,18)accent(bold(x),macron) + mat(delim: "[",-1/8 b + 1/24 c;1/4 b;a - 1/2 b)u
  $
  Thus if $a != 1/2 b$ then the system is controllable.
+ Given a linear time-invariant system $xbd = bold(A)xb + bold(B)u$.If $xb_a,xb_b$ is controllable states of the system,try to prove that $alpha xb_a + beta xb_b$ state is also a controllable state of the system.

  Solution:$xb_a,xb_b$ is controllable states of the system means 
  $
  exists t_1,t_2,u_1,u_2 "such that" xb(t_(1,2)) = e^(bold(A)t_(1,2))xb_(a,b) + integral_0^t_(1,2) e^(bold(A)(t_(1,2)-tau))bold(B)u_(1,2)(tau) dd(tau) = 0
  $
  W.L.O.G we assume $t_1 < t_2$.
  $
  "Let" u_3(t) = cases(alpha u_1(t) + beta u_2(t) "if" 0 <= t <= t_1\
  beta u_2 (t) "if" t_1 < t <= t_2\
  )\
  "And we have:" xb_alpha = - integral_0^t_1 e^(bold(A) tau)bold(B)u_1(tau) dd((tau))\
  xb_beta = - integral_0^t_2 e^(bold(A) tau)bold(B)u_2(tau) dd((tau))\

  "Thus" xb(t) = e^(bold(A)t)(alpha xb_a + beta xb_b) + integral_0^t e^(bold(A)(t-tau))bold(B)u_3(tau) dd(tau) \
  = e^(bold(A)t )( integral_0^t e^(-bold(A)tau)bold(B)u_3(tau)dd(tau) - integral_0^t_1 e^(-bold(A)tau)bold(B)alpha u_1(tau)dd(tau) - integral_0^t_2 e^(-bold(A)tau)bold(B) beta u_2(tau)dd(tau) )\
  "Let" t = t_2 ,xb(t_2) = 0
  $
  Thus the state $alpha xb_a + beta xb_b$ is also a controllable state of the system.

+ Transform the following system to controllable canonical form.
  $
  xbd = mat(delim: "[",1,-2;3,4)xb + mat(delim: "[",1;1)u
  $
  Solution:
  $
  Qb_c = mat(delim: "[",bold(B),bold(A)bold(B)) = mat(delim: "[",1,-1;1,7)\
  rank(Qb_c) = 2 = n\
  "Let" bold(P) = mat(delim: "[",bold(B),bold(A)bold(B))^(-1) = mat(delim: "[",1,-1;1,7)^(-1) = mat(delim: "[",7/8,1/8;-1/8,1/8)\
  xbl = bold(P)xb\
  Abl = bold(P)bold(A)bold(P)^(-1) = mat(delim: "[",0,-10;1,5)\
  Bbl = bold(P)bold(B) = mat(delim: "[",1,0)\
  "Controllable canonical form" accent(xbl,dot) = mat(delim: "[",0,-10;1,5)xbl + mat(delim: "[",1;0)u
  $