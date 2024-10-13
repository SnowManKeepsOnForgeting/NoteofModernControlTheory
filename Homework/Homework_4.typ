#import "@preview/physica:0.9.3":*
#import "@preview/i-figured:0.2.4"

#let xb = $bold(x)$
#let ub = $bold(u)$
#let Qb = $bold(Q)$
#let xbd = $accent(bold(x),dot)$

+ Determine the controllability of the following systems:

  (1) $xbd = mat(delim: "[",1,1;1,0)xb + mat(delim: "[",1;0)ub$

  (2) $xbd = mat(delim: "[",0,1,0;0,0,1;-2,-4,-3) xb + mat(delim: "[",1,0;0,1;-1,1)ub$

  (3) $xbd = mat(delim: "[",-3,1,0;0,-3,1;0,0,-1)xb + mat(delim: "[",1,-1;0,0;2,0)ub$

  (4) $xbd = mat(delim: "[",lambda_1,1,0,0;0,lambda_1,0,0;0,0,lambda_1,0;0,0,0,lambda_1) xb + mat(delim: "[",0;1;1;1)ub$

  (5) $xbd = mat(delim: "[",0,4,3;0,20,16;0,-25,-20)xb + mat(delim: "[",-1;3;0)ub$

  Solution:(1)We use Kalman's controllability criterion to determine the controllability of the system.
  
  We have:
  $
  bold(Q)_c = mat(delim: "[",bold(B),bold(A B))\
  = mat(delim: "[",1,1;0,1)\
  rank(bold(Q)_c) = 2=n\
  $
  Thus the system is controllable.

  (2)
  $
  bold(Q)_c = mat(delim:"[", bold(B), bold(A B), bold(A^2 B))\
  = mat(delim: "[",1,0,0,1,-1,1;0,1,-1,1,-5,-7;-1,1,-5,-7,19,15)\
  rank(bold(Q)_c) = 3 = n\
  $
  Thus the system is controllable.

  (3) We use PBH's controllability criterion to determine the controllability of the system.The eigenvalues of the matrix $A$ are $-3,-3,-1$. We have:
  $
  lambda_(1,2) = -3,lambda_3 = -1\
  rank(mat(delim: "[",lambda_(1,2) I-A,B)) =rank(mat(delim: "[",0,-1,0,1,-1;0,0,-1,0,0;0,0,-2,2,0)) = 3=n\
  rank(mat(delim: "[",lambda_3 I-A,B)) = rank(mat(delim: "[",2,-1,0,1,-1;0,2,-1,0,0;0,0,0,2,0)) = 3=n\
  $
  Thus the system is controllable.

  (4) We use PBH's controllability criterion to determine the controllability of the system. All eigenvalues of the matrix $A$ are $lambda_1$.We have:
  $
  rank(mat(delim: "[",lambda_1 I-A,B)) = rank(mat(delim: "[",0,-1,0,0,0;0,0,0,0,1;0,0,0,0,1;0,0,0,0,1)) = 2<n\
  $
  Thus the system is not controllable.

  (5) We use Kalman's controllability criterion to determine the controllability of the system. 
  $
  Qb_c = mat(delim: "[",bold(B),bold(A B),bold(A^2 B))\
  = mat(delim: "[",-1,12,15;3,60,480;0,-75,0)\
  rank(Qb_c) = 3 = n\
  $
  Thus the system is controllable.
 