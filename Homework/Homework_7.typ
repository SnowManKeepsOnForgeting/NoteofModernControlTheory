#import "@preview/physica:0.9.3": *
#import "@preview/i-figured:0.2.4"

#let xbd = $dot(bold(x))$
#let xb = $bold(x)$
#let xd = $dot(x)$
#let ub = $bold(u)$
#let Ib = $bold(I)$
#let Ab = $bold(A)$
#let Ebtilde = $tilde(bold(E))$
#let Eb = $bold(E)$
#let Kb = $bold(K)$
#let Qb = $bold(Q)$
#let Pb = $bold(P)$
#let lambdab = $bold(lambda)$
#let fb = $bold(f)$

#set math.mat(delim: "[")

+ Given a system below:
  $
    xbd = mat(delim: "[",-1,-2,-3;0,-1,1;1,0,-1)xb + mat(delim: "[",2;0;1)ub\
    y = mat(delim: "[",1,1,0)xb
  $
  Design a full-order state observer with eigenvalues -3, -4, -5.

  *Solution*:
  $
    det(s Ib - Ab^T) = mat(delim: "|",s+1,0,-1;2,s+1,0;3,-1,s+1) = s^3 + 3s^2 + 6s + 6\
    a_0 = 6,a_1=6,a_2 = 3\
    alpha^*(s) = (s+3)(s+4)(s+5) = s^3 + 12s^2 + 47s + 60\
    Ebtilde = mat(delim: "[",a_3)\
    a^*_0 = 60,a^*_1 = 47,a^*_2 = 12\
    Ebtilde = mat(delim: "[",a^*_0-a_0, a^*_1-a_1, a^*_2-a_2) = mat(delim: "[",54,41,9)\
    Qb = mat(delim: "[",1,-1,-1;1,-3,5;0,-2,2) mat(delim: "[",6,3,1;3,1,0;1,0,0) = mat(delim: "[",2,2,1;2,0,1;-4,-2,0)\
    Pb = Qb^(-1) = mat(delim: "[",- 1/4,1/4, 1/4;1/2,- 1/2,0;1/2,1/2,1/2)\
    Eb^T = Ebtilde^T P = mat(delim: "[",23/2,- 5/2,-9)
  $

+ Given a system below:
  $
    xbd = mat(delim: "[",0,1,0,0;0,0,-2,0;0,0,0,1;0,0,4,0)xb + mat(delim: "[",0;1;0;-1)u\

    y = mat(delim: "[",1,0,0,0)xb
  $
  - Design a state feedback gain $Kb$ such that $lambda_1^* = -1,lambda_(2,3)^*=-1 plus.minus j,lambda_4^* = -2$.
  - Design a reduced-order state observer such that eigenvalues are $lambda_1=-3,lambda_(2,3) = -3 plus.minus 2 j$
  - Determine the reconstructed state $hat(xb)$ and the state feedback law composed of $hat(xb)$.

  *Solution*:
  (1)$alpha^*(s) = (s+1)(s+1-j)(s+1+j)(s+2) = s^4+5s^3+10s^2+10s+4$

  Let $K = -mat(delim: "[",k_1,k_2,k_3,k_4)$

  $
    Ab - bold(B)K = mat(delim: "[",0,1,0,0;k_1,k_2,k_3-2,k_4;0,0,0,1;-k_1,-k_2,4-k_3,-k_4)\

    alpha(s) = s^4 +(k_4-k_2)s^3 + (k_3-k_1-4)s^2 + 2k_2s + 2k_1
  $
  Compare the coefficients of $alpha(s)$ and $alpha^*(s)$, we have:
  $
    K =- mat(delim: "[",2,5,16,10)
  $

  (2)We note:
  $
    A_11 = 0,A_12 =mat(delim: "[",1,0,0),A_21 = mat(delim: "[",0;0;0),A_22 = mat(delim: "[",0,-2,0;0,0,1;0,4,0)\
    B_1= 0,B_2 = mat(delim: "[",1;0;-1)\
    alpha^*(s) = (s+3)(s+3-2j)(s+3+2j) = s^3 + 9s^2 + 31s + 39
  $
  We let:$L = mat(delim: "[",l_1;l_2;l_3)$,then we have:
  $
    A_22 - L A_12 = mat(delim: "[",-l_1,-2,0;-l_2,0,1;-l_3,4,0)\
    alpha(s) = s^3 + l_1 s^2 - (2l_1 + 4)s - (2l_3 + 4 l_1)
  $
  Compare the coefficients of $alpha(s)$ and $alpha^*(s)$, we have:
  $
    L = mat(delim: "[",9;-35/2;-75/2)
  $
  By substituting $L$ into system, we have:
  $
    dot(bold(z)) = mat(delim: "[",-9,-2,0;35/2,0,1;75/2,4,0)bold(z) + mat(delim: "[",-46;120;535/2)bold(y) + mat(delim: "[",1;0;-1)bold(u)
  $ 
  (3) Substituting equation above into system, we have:
  $
    xbd = mat(delim: "[",1,0,0,0;9,1,0,0;-35/2,0,1,0;-75/2,0,0,1) mat(delim: "[",y;z_1;z_2;z_3)\
    bold(u) = v + mat(delim: "[",2,5,16,10)xbd
  $

+ A particle moves along the curve $y=f(x)$ from point (0,8) to (4,0). Assuming the particle's speed is $x$, what shape should the curve take to minimize the travel time?

  *Solution*:
  We have:
  $
    dv(s,t) = sqrt(1 + (f'(x))^2)dv(x,t) = x \
    dd(t) = sqrt(1 + (f'(x))^2)/x dd(x)
  $
  Thus we need to find a functional $J$ such that minimize:
  $
    J(x) = integral_0^4 sqrt(1 + (f'(x))^2)/x dd(x)\
    f(0) = 8,f(4) = 0
  $
  By using Euler equation, note $y=f(x)$ and we have:
  $
    dv(,x)(pdv(,y')(sqrt(1+y'^2)/x))
  $
  We have:
  $
    (x y'')/(1 + y'^2) =y'
  $
  Let $y' = tan theta$,$y'' = dv(y',theta) dv(theta,x) = 1/(cos^2 theta) dv(theta,x)$.Substituting $y'$ and $y''$ into equation above, we have:
  $
    x dv(theta,x) = tan theta
  $
  Solving the equation above, we have:
  $
    cases(
      x = c_1 sin theta\
      y' = tan theta
    )
  $
  Thus we have:
  $
    dd(y) = tan theta dd(x) = c_1 sin theta dd(theta)
  $
  By integrating the equation above, we have:
  $
    cases(
      x = c_1 sin theta\
      y = -c_1 cos theta + c_2
    )
  $
  By substituting $f(0) = 8,f(4) = 0$, we have:
  $
    c_1 = 5,c_2 = 3
  $
  Thus the shape of curve should be:
  $
    x^2 + (y-3)^2 = 25
  $

+ Assume a simplified control system of satellite is given by:
  $
    xbd = mat(delim: "[",0,1,0,0) xb + mat(delim: "[",0;1;) ub\
  $
  Target functional is:
  $
    J = 1/2 integral_0^2 u^2(t) dd(t)
  $
  And boundary conditions are:
  $
    xb(0) = mat(delim: "[",1;1),xb(2) = mat(delim: "[",0;0)
  $
  Try to find the optimal control $ub$ and curve $xb^*(t)$.

  *Solution*:
  We have:
  $
    L = 1/2 u^2,lambdab^T = mat(delim: "[",lambda_1,lambda_2),fb = mat(delim: "[",x_2,u)\
    H = L + lambdab^T fb = 1/2 u^2 + lambda_1 x_2 + lambda_2 u\
    G = H - lambdab^T xbd = 1/2 u^2 + lambda_1 (x_2 - xd_1) + lambda_2 (u-xd_2)
  $
  Using Euler equation, we have:
  $
    pdv(L,x_1) - dv(,t)pdv(L,xd_1)= dot(lambda)_1 = 0,lambda_1 = a\
    pdv(L,x_2) - dv(,t)pdv(L,xd_2)= lambda_1 + dot(lambda)_2 = 0,lambda_2 = -a t+b\
    pdv(L,u) - dv(,t)pdv(L,dot(u))= u+lambda_2 = 0,u = a t - b
  $
  And we have:
  $
    xd_2 = a t - b,x_2 = 1/2 a t^2 - b t + c\
    xd_1 = x_2= 1/2 a t^2 - b t + c,x_1 = 1/6 a t^3 - 1/2 b t^2 + c t + d
  $
  By substituting boundary conditions, we have:
  $
    a=3,b=7/2,c=1,d=1
  $
  Thus the optimal curve and control are:
  $
    x_1^*(t) = 1/2 t^3 -7/4 t^2 + t + 1\
    x_2^*(t) = 3/2 t^2 - 7/2 t + 1\
    u^*(t) = 3 t - 7/2
  $

+ Given a system below:
  $
    dv(x_1,t) = x_2,dv(x_2,t) = u(t)
  $
  Try to transfer the system from $mat(delim: "[",x_1(0);x_2(0)) = mat(delim: "[",1;1)$ to $mat(delim: "[",x_1(2);x_2(2)) = mat(delim: "[",0;0)$ within 2 seconds and minimize the functional:
  $
    J = 1/2 integral_0^2 u^2(t) dd(t)
  $
  Try to find the optimal control $ub$.

  *Solution*:
  The system is given by:
  $
    xbd = mat(delim: "[",0,1;0,0) xb + mat(delim: "[",0;1) ub\
  $
  The Hamiltonian is given by:
  $
    H = 1/2 u^2 + lambdab (mat(delim: "[",0,1;0,0) xb + mat(delim: "[",0;1) ub)\
    = 1/2 u^2 + lambda_1 x_2 + lambda_2 u
  $
  Let $pdv(H,u) = 0$, we have:
  $
    u = -lambda_2
  $
  Using Hamiltonian companion equations, we have:
  $
    mat(dot(lambda)_1;dot(lambda)_2) = - pdv(H,x) = mat(0;-lambda_1)
  $
  Thus we have:
  $
    cases(
      lambda_1 = a\
      lambda_2 = -a t + b\
      u = a t - b\
      x_1 = 1/6 a t^3 - 1/2 b t^2 + c t + d\
      x_2 = 1/2 a t^2 - b t + c
    )
  $
  By substituting boundary conditions, we have:
  $
    a = 3,b = 7/2,c = 1,d = 1
  $
  Thus the optimal control is:
  $
    u^*(t) = 3 t - 7/2
  $
  The optimal curve is:
  $
    x_1^*(t) = 1/2 t^3 - 7/4 t^2 + t + 1\
    x_2^*(t) = 3/2 t^2 - 7/2 t + 1
  $