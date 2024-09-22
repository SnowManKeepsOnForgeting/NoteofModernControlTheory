#import "@preview/physica:0.9.3": *
#import "@preview/i-figured:0.2.4"

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
+ Given transfer function of system.try to establish its state space representation.
    
    (1)$g(s) = (s^3+s+1)/(s^3+6 s^2 + 11s + 6)$

    Solution:
    $
    g(s) = (s^3+s+1)/(s^3+6 s^2 + 11s + 6) = 1 + (-6s^2 -10s -5)/(s^3+6 s^2 + 11s + 6)
    $
    Let $h(s) = (-6s^2 -10s -5)/(s^3+6 s^2 + 11s + 6)$
    Introduce intermediate variable $Z(s)$
    $
    h(s) = Y(s)/Z(s) Z(s)/U(s) = (-6s^2 -10s -5)/1  1/(s^3+6 s^2 + 11s + 6) 
    $
    Thus we have:
    $
    cases(
    y = -6z^((2)) - 10 z^((1)) - 5 z \
    z^((3)) + 6 z^((2)) + 11 z^((1)) + 6z= u
    )
    $
    Let us choose $x_1 = z,x_2 = z^((1)),x_3 = z^((2))$
    We have state equations:
    $
    cases(
    accent(x,dot)_1 = x_2\
    accent(x,dot)_2 = x_3\
    accent(x,dot)_3 = -6 x_3 -11 x_2 - 6x_1 + u

    )
    $
    And output equation:
    $
    y = -6 x_3 - 10 x_2 - 5 x_1 + u
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
+ Try to transform the state matrix into Jordan canonical form.

    (1)$vec(delim: "[",accent(x,dot)_1,accent(x,dot)_2,accent(x,dot)_3) = mat(delim: "[",4,1,-2;1,0,2;1,-1,3) vec(delim: "[",x_1,x_2,x_3) + mat(delim: "[",3,1;2,7;5,3) vec(delim: "[",u_1,u_2)$

    Solution:Let $bold(A) = mat(delim: "[",4,1,-2;1,0,2;1,-1,3)$ and $bold(B) = mat(delim: "[",3,1;2,7;5,3)$

    Let us find the eigenvalues vectors of $bold(A)$
    $
    |lambda bold(I) - bold(A)| = mat(delim: "|",lambda-4,-1,2;-1,lambda,-2;-1,1,lambda-3) = lambda^3 - 7 lambda^2 + 15 lambda - 9 = 0\
    lambda_1 = 1,lambda_2 = 3,lambda_3 = 3
    $
    Let
    $
    |bold(I) - bold(A)| bold(v)= mat(delim: "[",-3,-1,2;
    -1,1,-2;-1,1,-2) bold(v) = 0\
    bold(v_1) = vec(delim: "[",0,2,1)\
    |3 bold(I) - bold(A)| bold(v_1) = mat(delim: "[",-1,-1,2;-1,3,-2;-1,1,0) bold(v) = 0\
    bold(v_2) = vec(delim: "[",1,1,1)\
    $
    Let 
    $
    |3 bold(I) - bold(A)| bold(v_3) = mat(delim: "[",-1,-1,2;-1,3,-2;-1,1,0) bold(v_3) = -bold(v_2) = vec(delim: "[",-1,-1,-1)\
    bold(v_3) = vec(delim: "[",1,0,0)
    $
    Thus we have transformation matrix:
    $
    bold(P) = mat(delim: "[",0,1,1;2,1,0;1,1,0) "and" bold(P)^(-1) = mat(delim: "[",0,1,-1;0,-1,2;1,1,-2)
    $
    So we have:
    $
    accent(bold(A),macron) = bold(P)^(-1) bold(A) bold(P) = mat(delim: "[",1,0,0;0,3,1;0,0,3)\
    accent(bold(B),macron) = bold(P)^(-1) bold(B) = mat(delim: "[",-3,4;8,-1;15,14)
    $
    Thus the Jordan canonical form is:
    $
    accent(accent(bold(x),macron),dot) = mat(delim: "[",1,0,0;0,3,1;0,0,3)accent(bold(x),macron) + mat(delim: "[",-3,4;8,-1;15,14)vec(delim: "[",u_1,u_2)
    $

+ Let the forward path transfer function matrix and the feedback path transfer function matrix of the system be matrix below. Find the closed-loop transfer function matrix.
  $
  bold(G) = mat(delim: "[",1/(s+1),-1/s;2,1/(s+2)), bold(H) = mat(delim: "[",1,0;0,1)
  $
  Solution:
  $
  bold(G)_(bold(H))(s) = (bold(I) + bold(G)(s)bold(H)(s))^(-1)bold(G)(s) = mat(delim: "[",(s+2)/(s+1) , -1/s;2,(s+3)/(s+2))^(-1) mat(delim: "[",1/(s+1),-1/s;2,1/(s+2))\
  =mat(delim: "[",(s(s+1)(s+3))/((s+2)(s^2+5s+2)),(s+1)/(s^2+5s+2);(-2s(s+1))/(s^2+5s+2),(s(s+2))/(s^2+5s+2)) mat(delim: "[",1/(s+1),-1/s;2,1/(s+2))\
  =mat(delim: "[",(3s^2+9s+4)/(s^2+5s+2),(-s-1)/(s^2+5s+2);(2s(s+1))/(s^2+5s+2),(3s+2)/(s^2+5s+2))\
  $