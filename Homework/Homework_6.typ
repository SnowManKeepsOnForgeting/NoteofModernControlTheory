#import "@preview/physica:0.9.3":*
#import "@preview/i-figured:0.2.4"

#let xb = $bold(x)$
#let xbd = $accent(bold(x),dot)$
#let xbl = $accent(bold(x),macron)$
#let xbt = $accent(bold(x),tilde)$
#let yb = $bold(y)$
#let ub = $bold(u)$
#let Qb = $bold(Q)$
#let Abl = $accent(bold(A),macron)$
#let Abt = $accent(bold(A),tilde)$
#let Bbl = $accent(bold(B),macron)$
#let Bbt = $accent(bold(B),tilde)$
#let Ab = $bold(A)$
#let Bb = $bold(B)$
#let Cb = $bold(C)$
#let Cbt = $accent(bold(C),tilde)$

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

+ Given a following system:
  $
    xbd = mat(delim: "[",lambda,1,0;0,lambda,0;0,0,lambda)xb + mat(delim: "[",a;b;c)u,y = mat(delim: "[",d,e,f)xb
  $
  (1) If there exists values of $a,b,c$ such that the system is controllable.

  (2) If there exists values of $d,e,f$ such that the system is observable.

  Solution:(1) We calculate the controllability matrix $Qb_c$.
  $
    Qb_c = mat(delim: "[",Bb,Ab Bb,Ab^2 Bb) = mat(delim: "[",a,lambda a + b,lambda^2 a + 2 lambda b;
    b,lambda b,lambda^2 b;
    c ,lambda c,lambda^2 c)\
  $if either $b,c$ is zero,this matrix is not full rank.Thus the system is not controllable.

  (2) We calculate the observability matrix $Qb_o$.
  $
    Qb_o = mat(delim: "[",Cb;Cb Ab;Cb Ab^2) = mat(delim: "[",d,e,f;lambda d,d + lambda e,lambda f;
    lambda^2 d ,2lambda d + lambda^2 e ,lambda^2 f)\
  $This matrix is not full rank.Thus the system is not observable.

+ Given a transfer function of system:
  $
    g(s) = (2s+8)/(2s^3 + 12 s^2 +22s +12)
  $
  (1) Try to establish the state space representation of the system by controllability canonical form.

  Solution:Let $g(s) = Y(s)/Z(s) Z(s)/U(s)$,we have:
  $
    y = 2z^' +  8z\
    2 z^''' + 12 z^'' + 22 z^' + 12 z = u
  $
  Let $x_1 = z,x_2 = z^' ,x_3 = z^''$,we have:
  $
    cases(
      x_1^' = x_2,
      x_2^' = x_3,
      x_3^' = -6 x_1 - 11 x_2 - 6 x_3 + 1/2u,
      y = 8 x_1 + 2 x_2
    )
  $
  Also as:
  $
    xbd = mat(delim: "[",0,1,0;0,0,1;-6,-11,-6)xb + mat(delim: "[",0;0;1/2)u,y = mat(delim: "[",8,2,0)xb
  $

+ Given following system:
  $
    cases(
      xbd_1 = x_2,
      xbd_2 = x_3,
      xbd_3 = - x_1 -  x_2 -  x_3 + 3u,
    )
  $
  Try to Try to determine the linear state feedback control law such that all the closed-loop poles are at -3.
  $
    Delta^*_k (s)= product_(i=1)^(n) (s - s_i) = (s + 3)^3 \
    xbd = mat(delim: "[",0,1,0;0,0,1;-1,-1,-1)xb + mat(delim: "[",0;0;3)u\
    "let" u = - mat(delim: "[",k_0,k_1,k_2)xb\
    xbd = mat(delim: "[",0,1,0;0,0,1;-1-3k_0,-1-3k_2,-1-3k_2)xb\
    Delta_k (s) = det(s I - A) = s^3 + (1+3k_2)s^2 + (1+3k_1)s + 1 + 3k_0\
  $
  By comparing the coefficients of $Delta_k (s)$ and $Delta^*_k (s)$,we have:
  $
    k_0=26/3,k_1=26/3,k_2=8/3\
    u = - mat(delim: "[",26/3,26/3,8/3)xb
  $

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