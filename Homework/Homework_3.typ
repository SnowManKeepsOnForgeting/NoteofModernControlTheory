#import "@preview/physica:0.9.3":*
#import "@preview/i-figured:0.2.4"

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

+ Given a second order differential equation below:
  $
  accent(y,dot.double) + omega^2 y = 0
  $
  Choose state variables as $x_1 = y,x_2 = accent(y,dot)$.The state equation is:
  $
  accent(bold(x),dot) = mat(delim: "[",0,omega;-omega,0)bold(x)
  $
  Prove that the transformation matrix of the system is:
  $
  bold(Phi)(t,0) = mat(delim: "[",cos(omega t),sin(omega t);-sin(omega t),cos(omega t))
  $

  Solution:
  $
  (s bold(I) - bold(A)) = mat(delim: "[",s,omega;-omega,s)\
  (s bold(I) - bold(A))^(-1) = mat(delim: "[",s/(s^2 + omega^2),-omega/(s^2 + omega^2);omega/(s^2 + omega^2),s/(s^2 + omega^2))\
  $
  Thus we have the state transition matrix:
  $
  e^(bold(A)t) = cal(L)^(-1)(s bold(I) - bold(A))^(-1) = mat(delim: "[",cos(omega t),sin(omega t);-sin(omega t),cos(omega t))
  $

+ Try to find transition matrix of the system by using if $bold(A) bold(B) = bold(B) bold(A)$,then $e^((bold(A) + bold(B))t) = e^(bold(A)t) e^(bold(B)t)$.

  $
  accent(bold(x),dot) = mat(delim: "[",sigma,omega;-omega,sigma)bold(x)
  $

  Solution:We have
  $
  mat(delim: "[",sigma,0;0,sigma) mat(delim: "[",0,omega;-omega,0) = mat(delim: "[",0,omega;-omega,0)mat(delim: "[",sigma,0;0,sigma) 
  $
  Let
  $
  bold(A) = mat(delim: "[",sigma,0;0,sigma),bold(B)= mat(delim: "[",0,omega;-omega,0)
  $
  So the state transition matrix is:
  $
  e^((bold(A) + bold(B))t) = e^(bold(A)t) e^(bold(B)t) = mat(delim: "[",cos(omega t)e^(sigma t),sin(omega t)e^(sigma t);-sin(omega t)e^(sigma t),cos(omega t)e^(sigma t))
  $

+ Given a transition matrix of a system $accent(bold(x),dot) = bold(A) bold(x)$,try to find the matrix $bold(A)$.
   $
   bold(Phi)(t,0) = mat(delim: "[",2e^(-t)-e^(-2t),2(e^(-2t) - e^(-t));e^(-t) - e^(-2t),2e^(-2t) - e^(-t))
   $
   
   Solution:
   $
   cal(L)[bold(Phi)(t,0)] = mat(delim: "[",2/(s+1) - 1/(s+2),2/(s+2) - 2/(s+1);1/(s+1) - 1/(s+2),2/(s+2) - 1/(s+1)) = (s bold(I) - bold(A))^(-1) \
   (s bold(I) - bold(A)) = mat(delim: "[",2/(s+1) - 1/(s+2),2/(s+2) - 2/(s+1);1/(s+1) - 1/(s+2),2/(s+2) - 1/(s+1))^(-1) = mat(delim: "[",s,2;-1,s+3)
   $
   Thus we have the matrix $bold(A)$:
   $
   bold(A) = mat(delim: "[",0,2;1,-3)
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
