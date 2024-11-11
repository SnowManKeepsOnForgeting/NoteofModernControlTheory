#import "@preview/physica:0.9.3": *
#import "@preview/i-figured:0.2.4"

#let xbd = $dot(bold(x))$
#let xb = $bold(x)$
#let ub = $bold(u)$
#let Qb = $bold(Q)$
#let yb = $bold(y)$
#let Ab = $bold(A)$
#let Bb = $bold(B)$
#let Cb = $bold(C)$
#let Abt = $tilde(bold(A))$
#let Bbt = $tilde(bold(B))$
#let Cbt = $tilde(bold(C))$
#let xbt = $tilde(bold(x))$
#let Kb = $bold(K)$
#let lambdab = $bold(lambda)$
#let fb = $bold(f)$
#let xd = $dot(x)$

+ Given differential equations of system,try to write down their state space representation.

  (1) $accent(y,dot.triple) + accent(y,dot.double) + 4 accent(y,dot) + 5 y = 3 u$ 
  
  (2) $2 accent(y,dot.triple) + 3 accent(y,dot) = accent(u,dot.double) - u$ 

 Solution:(1)let us choose $x_1=y,x_2=accent(y,dot),x_3=accent(y,dot.double)$ as state variables.We have state equations:
 $
 cases(
  accent(x_1,dot) = x_2\
  accent(x_2,dot) = x_3\
  accent(x_3,dot) = -5 x_1 - 3 x_2 - 2 x_3 + 7 u
 )
 $
 And output equation:
 $
 y = x_1
 $
 (2)Let $2 accent(y,tilde)^((3)) + 3 accent(y,tilde)^((1)) = u$
 We have:
 $
 y = accent(y,tilde)^((2)) - accent(y,tilde)^((1))
 $
 Let us choose $x_1 = accent(y,tilde),x_2 = accent(y,tilde)^((1)),x_3 = accent(y,tilde)^((2))$
 We have state equations:
 $
 cases(
  accent(x,dot)_1 = x_2\
  accent(x,dot)_2 = x_3\
  accent(x,dot)_3 = -3/2 x_2 + 1/2 u
 )
 $
 And output equation:
 $
 y = x_3 - x_2
 $
+ Try to transform the state matrix into diagonal canonical form.

    (1)$vec(delim: "[",accent(x,dot)_1,accent(x,dot)_2) = mat(delim: "[",0,1;-5,-6) vec(delim: "[",x_1,x_2) + vec(delim: "[",0,1)u$

    Solution:
    Let $bold(A) = mat(delim: "[",0,1;-5,-6)$ and $bold(B) = vec(delim: "[",0,1)$

    Let us find the eigenvalues vectors of $bold(A)$
    $
    |lambda bold(I) - bold(A)| = mat(delim: "|",lambda,-1;5,lambda+6) = lambda^2 + 6 lambda + 5 = 0\
    lambda_1 = -1,lambda_2 = -5
    $
    Let 
    $
    (-bold(I) - bold(A)) bold(v_1) = mat(delim: "[",-1,-1;5,5)bold(v_1) = 0\
    (-5bold(I)-bold(A)) bold(v_2) = mat(delim: "[",-5,-1;5,1)bold(v_2) = 0
    $
    Take the basic solution$bold(v_1) = vec(delim: "[",1,-1),bold(v_2) = vec(delim: "[",1,-5)$

    Thus we have transformation matrix 
    $
    bold(P) = mat(delim: "[",1,1;-1,-5) "and" bold(P)^(-1) = mat(delim: "[",5/4,1/4;-1/4,-1/4)
    $
    So we have:
    $
    accent(bold(A),macron) = bold(P)^(-1) bold(A) bold(P) = mat(delim: "[",-1,0;0,-5)\
    accent(bold(B),macron) = bold(P)^(-1) bold(B) = vec(delim: "[",1/4,-1/4)
    $
    Thus the diagonal canonical form is:
    $
    accent(accent(bold(x),macron),dot) = mat(delim: "[",-1,0;0,-5)accent(bold(x),macron) + vec(delim: "[",1/4,-1/4)u
    $
+ Given a state space representation,try to find the transfer function of the system.
  $
  cases(
    bold(accent(x,dot)) = mat(delim: "[",-5,-1;3,-1)bold(x) + mat(delim: "[",2;5)u\
    y = [1,2]bold(x) + 4 u
  )
  $
  *Solution*:
  $
  g(s) = Y(s)/U(s) &= bold(C)(s bold(I)- bold(A))^(-1) bold(B) + D\
  &= [1,2] mat(delim: "[",s+5,1;-3,s+1)^(-1) mat(delim: "[",2;5) + 4\
  &= (12 s + 59)/(s^2 + 6 s + 8) + 4
  $


+ Given representation of state equations and initial condition of a system.

  $
  accent(bold(x),dot) = mat(delim: "[",1,0,0;0,1,0;0,1,2)bold(x) , bold(x)(0) = mat(delim: "[",1;0;1)
  $
  
  (1)Try to find its state transition matrix by using Laplace transformation.

  (2)Try to find its state transition matrix by using diagonal canonical form.

  (3)Try to find its state transition matrix by finite terms.

  (4)Find the solution of the homogeneous state equation based on the given initial condition.
  
  Solution:
  
  (1)Let $bold(A) = mat(delim: "[",1,0,0;0,1,0;0,1,2)$
  $
  (s bold(I) - bold(A)) = mat(delim: "[",s-1,0,0;0,s-1,0;0,-1,s-2)\
  (s bold(I) - bold(A))^(-1) = mat(delim: "[",1/(s-1),0,0;0,1/(s-1),0;0,1/(s-2) - 1/(s-1),1/(s-2))
  $
  Thus the state transition matrix is:
  $
  e^(bold(A)t) = cal(L)^(-1)(s bold(I) - bold(A))^(-1) = mat(delim: "[",e^t,0,0;0,e^t,0;0,e^(2t) - e^t,e^(2t)) 
  $

  (2)Let us find the eigenvalues vectors of $bold(A)$
  $
  |lambda bold(I) - bold(A)| = mat(delim: "|",lambda-1,0,0;0,lambda-1,0;0,-1,lambda-2) = (lambda - 1)^2 (lambda -2) \
  lambda_1 = 1,lambda_2 = 1,lambda_3 = 2\
  $
  And the eigenvalues vectors are:
  $
  bold(v_1) = vec(delim: "[",1,0,0),bold(v_2) = vec(delim: "[",0,-1,1),bold(v_3) = vec(delim: "[",0,0,1)
  $
  Thus we have transformation matrix:
  $
  bold(P) = mat(delim: "[",1,0,0;0,-1,0;0,1,1) "and" bold(P)^(-1) = mat(delim: "[",1,0,0;0,-1,0;0,1,1)
  $
  So the state transition matrix is:
  $
  e^(bold(A)t) = bold(P) mat(delim: "[",e^t,0,0;0,e^t,0;0,0,e^(2t)) bold(P)^(-1) = mat(delim: "[",e^t,0,0;0,e^t,0;0,e^(2t) - e^t,e^(2t)) 
  $
  
  (3)We have:
  $
  cases(
    a_0(t) = -2t e^t + e^(2t)\
    a_1(t) = 2 e^t +3 e^(t) - 2 e^(2t)\
    a_2(t) = -e^t - t e^(t) +  e^(2t)
  )
  $
  Thus the state transition matrix is:
  $
  e^(bold(A)t) = a_0(t) bold(I) + a_1(t) bold(A) + a_2(t) bold(A)^2 = mat(delim: "[",e^t,0,0;0,e^t,0;0,e^(2t) - e^t,e^(2t))
  $

  (4)
  $
  bold(x)(t) = e^(bold(A)t) bold(x)(0) = mat(delim: "[",e^t,0,0;0,e^t,0;0,e^(2t) - e^t,e^(2t)) mat(delim: "[",1;0;1) = mat(delim: "[",e^t;0;e^(2t))
  $

+ Given a representation of state equation of a system:
   
   $
   accent(bold(x),dot) = mat(delim: "[",0,1;-3,4)bold(x) + mat(delim: "[",1;1)u\
   y = mat(delim: "[",1,1)bold(x)
   $

   (1)Try to find the Unit step response of the system.

    Solution:We have:
    $
    Phi(t) = e^(bold(A)t) =cal(L)^(-1)(s bold(I) - A)= mat(delim: "[",3/2 e^t-1/2 e^(3t),-1/2 e^(t) + 1/2 e^(3t);3/2 e^t - 3/2 e^(3t),-1/2e^t + 3/2 e^(3t))\
    bold(x)(t) = e^(bold(A)t) bold(x)(0) = Phi(t)bold(x)(0) + integral_0^t Phi(t-tau)bold(B) bold(u)(tau) dd(tau)
    $
    Let $bold(x)(0) = 0$
    $
    x(t) = 1/2 integral_0^t mat(delim: "[",3/2 e^(t-tau) - 1/2 e^(3(t-tau)),-1/2 e^(t - tau) + 1/2 e^(3(t-tau));3/2 e^(t-tau) - 3/2 e^(3(t-tau)),-1/2e^(t-tau) + 3/2 e^(3(t-tau))) mat(delim: "[",1;1) dd(tau) = mat(delim: "[",e^t -1;e^t -1)\
    y = mat(delim: "[",1,1) mat(delim: "[",e^t -1;e^t -1) = 2e^t - 2
    $
+ Determine the controllability of the following systems:

  (1) $xbd = mat(delim: "[",1,1;1,0)xb + mat(delim: "[",1;0)ub$

  (3) $xbd = mat(delim: "[",-3,1,0;0,-3,1;0,0,-1)xb + mat(delim: "[",1,-1;0,0;2,0)ub$

  Solution:(1)We use Kalman's controllability criterion to determine the controllability of the system.
  
  We have:
  $
  bold(Q)_c = mat(delim: "[",bold(B),bold(A B))\
  = mat(delim: "[",1,1;0,1)\
  rank(bold(Q)_c) = 2=n\
  $
  Thus the system is controllable.

  (3) We use PBH's controllability criterion to determine the controllability of the system.The eigenvalues of the matrix $A$ are $-3,-3,-1$. We have:
  $
  lambda_(1,2) = -3,lambda_3 = -1\
  rank(mat(delim: "[",lambda_(1,2) I-A,B)) =rank(mat(delim: "[",0,-1,0,1,-1;0,0,-1,0,0;0,0,-2,2,0)) = 3=n\
  rank(mat(delim: "[",lambda_3 I-A,B)) = rank(mat(delim: "[",2,-1,0,1,-1;0,2,-1,0,0;0,0,0,2,0)) = 3=n\
  $
  Thus the system is controllable.

+ Determine the observability of the following systems:

  (1) $xbd = mat(delim: "[",1,1;1,0)xb,y = mat(delim: "[",1,1)xb$

  (2) $xbd = mat(delim: "[",0,4,3;0,20,16;0,-25,-20)xb,y = mat(delim: "[",-1,3,0)xb$

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


+ Transform the following system to controllable canonical form.
  $
  xbd = mat(delim: "[",1,-2;3,4)xb + mat(delim: "[",1;1)u
  $


+ Given a system $xbd = Ab xb + Bb u,y = Cb xb$.
  $
    Ab = mat(delim: "[",-2,2,-1;0,-2,0;1,-4,0),Bb = mat(delim: "[",0;0;1),Cb = mat(delim: "[",1,-1,1)
  $
  (1) Try to determine the controllability and observability of the system.

  (2) If the system is not controllable or observable,how many state variables are controllable or observable?

  (3) Write down the controllable subsystem and the observable subsystem.

  Solution:(1)
  $
    Qb_c = mat(delim: "[",Bb,Ab Bb,Ab^2 Bb) = mat(delim: "[",0,-1,2;0,0,0;1,0,-1)\
    rank(Qb_c) = 2 < n
  $
  Thus the system is not controllable.
  $
    Qb_o = mat(delim: "[",Cb;Cb Ab;Cb Ab^2) = mat(delim: "[",1,-1,1;-1,0,-1;1,2,1)\
    rank(Qb_o) = 2 < n
  $
  Thus the system is not observable.

  (2) We perform controllability decomposition on the system.We choose two linearly independent columns of $Qb_c$ and add another linearly independent vector to form transformation matrix $T_c$.
  $
    T_c = mat(delim: "[",0,-1,0;0,0,1;1,0,0)\
    T_c^(-1) = mat(delim: "[",0,0,1;-1,0,0;0,1,0)
  $
  We have:
  $
    Abt = T_c^(-1) Ab T_c = mat(delim: "[",0,-1,-4;1,-2,-2;0,0,-2),Bbt = T_c^(-1) Bb = mat(delim: "[",1;0;0),Cbt = Cb T_c = mat(delim: "[",1,-1,-1)
  $
  We have two controllable state variables.

  Then we perform observability decomposition on the system.We choose two linearly independent rows of $Qb_o$ and add another linearly independent vector to form transformation matrix $T_o$.
  $
    T_o^(-1) = mat(delim: "[",0,-1,0;1,0,1;1,0,0)\
    T_o^ = mat(delim: "[",0,0,1;-1,0,0;0,1,-1)
  $
  We have:
  $
    Abt = T_o^(-1) Ab T_o = mat(delim: "[",-2,0,0;2,-1,0;-2,-1,-1),Bbt = T_o^(-1) Bb = mat(delim: "[",0;1;0),Cbt = Cb T_o = mat(delim: "[",1,1,0)
  $
  We have two observable state variables.

  (3) The controllable subsystem is:
  $
    accent(xbt,dot)_1 = mat(delim: "[",0,-1;1,-2)xbt_1 + mat(delim: "[",1;0)u,y = mat(delim: "[",1,-1)xbt_1 
  $
  The observable subsystem is:
  $
    accent(xbt,dot)_1 = mat(delim: "[",-2,0;2,-1)xbt_1 + mat(delim: "[",0;1)u,y = mat(delim: "[",1,1)xbt_1
  $
+ Given a system $xbd = Ab xb + Bb u,y=Cb xb$.If 
  $
    Cb Bb = Cb Ab Bb = Cb Ab^2 Bb = dots= Cb Ab^(n-2) Bb = 0,Cb Ab^(n-1) Bb =k !=0
  $
  Try to prove that the system is always controllable and observable.

  Solution:We have:
  $
    Qb_o Qb_c = mat(delim: "[",Cb Bb,Cb Ab Bb,Cb Ab^2 Bb,dots,Cb Ab^(n-1) Bb;
    Cb Ab Bb,Cb Ab^2 Bb,Cb Ab^3 Bb,dots,Cb Ab^n Bb;
    dots.v,dots.v,dots.v,dots.down,dots.v;
    Cb Ab^(n-1) Bb,Cb Ab^n Bb,Cb Ab^(n+1) Bb,dots,Cb Ab^(2n-2) Bb;
    )\
    = mat(delim: "[",0,0,0,dots,0,k;
    0,0,0,dots,k,Cb Ab^n Bb;
    dots.v,dots.v,dots.v,dots.down,dots.v,dots.v;
    0,k,Cb Ab^n Bb,dots,Cb Ab^(2n-4) Bb,Cb Ab^(2n-3) Bb;
    k,Cb Ab^n Bb,Cb Ab^(n+1) Bb,dots,Cb Ab^(2n-3) Bb,Cb Ab^(2n-2) Bb;
    )\
    det[Qb_o Qb_c] = k^n != 0
  $
  Thus 
  $
    det[Qb_o] != 0,det[Qb_c] != 0
  $
  In other words these two matrix is full rank.Thus the system is always controllable and observable.


+ Given a system:
  $
    xbd = mat(delim: "[",0,0,0;1,-6,0;0,1,-12)xb + mat(delim: "[",1;0;0)u
  $
  Try to determine the state feedback $u = - bold(K)xb$ such that the closed-loop system has eigenvalues $lambda_1^* = -2,lambda_2^* = -1 +j,lambda_3^* = -1 - j$

  Solution:We have:
  $
    Delta^*_k (s) = (s + 2)(s + 1 - j)(s + 1 + j) = s^3 + 4s^2 + 6s +4\
  $
  Let $u = - mat(delim: "[",k_0,k_1,k_2)xb$,we have:
  $
    xbd = mat(delim: "[",-k_0,-k_1,-k_2;1,-6,0;0,1,-12)xb\
    Delta_k (s) = det(s I - A - B K) = s^3 + (18+k_0)s^2 +(72+18k_0 +k_1)s +72 k_0 +12 k_1 + k_2
    
  $
  By comparing the coefficients of $Delta_k (s)$ and $Delta^*_k (s)$,we have:
  $
    k_0 = -14,k_1 = 186,k_2 = -1220\
    u = - mat(delim: "[",-14,186,-1220)xb
  $
+ Given a system below:
  $
    xbd = mat(delim: "[",0,1,0,0;0,0,-2,0;0,0,0,1;0,0,4,0)xb + mat(delim: "[",0;1;0;-1)u\

    y = mat(delim: "[",1,0,0,0)xb
  $
  - Design a state feedback gain $Kb$ such that $lambda_1^* = -1,lambda_(2,3)^*=-1 plus.minus j,lambda_4^* = -2$.
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