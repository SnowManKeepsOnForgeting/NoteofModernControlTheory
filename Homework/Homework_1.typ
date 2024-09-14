#import "@preview/physica:0.9.3": *
#import "@preview/i-figured:0.2.4"



+ Given a circuit as shown in the figure below,let input be voltage $u_1$ and output be voltage $u_2$.Try to select state variables and write down the state space representation of the system.
  #figure(
    image("pic/电路图.svg",width: 50%), 
    caption: [Circuit diagram]
  )

  *Solution*:Let we choose $u_(c 1),u_(c 2)$ voltage across capacitors C1 and C2 as state variables.
  We have:
  $
  cases(
    u_(c 1) + i R_2 + u_(c 2) = u_1\
    i R_2 + u_(c 2) = u_2\
    C_1 dv(u_(c 1),t) + u_(c 1)/R_1 = i\
    C_2 dv(u_(c 2),t) = i
  )
  $
  Substituting $x_1 = u_(c 1),x_2 = u_(c 2)$ and reformulating the above equations,we get:
  $
  cases(
    accent(x_1,dot) = (u_1 - x_1 - x_2)/(C_1 R_2) - x_1/(C_1 R_1)\
    accent(x_2,dot) = (u_1 - x_1 - x_2)/(C_2 R_2)
  )
  $
  Let input $u_1 = u$ and Rewrite it as vector form:
  $
  vec(delim: "[",accent(x_1,dot),accent(x_2,dot)) = mat(delim: "[",- (R_1 + R_2)/(C_1 R_1 R_2),-1/(C_1 R_2); -1/(C_2 R_2),-1/(C_2 R_2)) vec(delim: "[",x_1,x_2) + vec(delim: "[",1/(C_1 R_2),1/(C_2 R_2)) u
  $

  Let output $u_2 = y$.The output equation is:
  $
  y = [-1,0]vec(delim: "[",x_1,x_2) + u
  $

  Therefore,the state space representation of the system is:
  $
  cases(
    vec(delim: "[",accent(x_1,dot),accent(x_2,dot)) = mat(delim: "[",- (R_1 + R_2)/(C_1 R_1 R_2),-1/(C_1 R_2); -1/(C_2 R_2),-1/(C_2 R_2)) vec(delim: "[",x_1,x_2) + vec(delim: "[",1/(C_1 R_2),1/(C_2 R_2)) u\
  y = [-1,0]vec(delim: "[",x_1,x_2) + u
  )
  $

+ Given a spring-damper system as shown in the figure below,try to establish the state space representation of the system.
  #figure(
    image("pic/弹簧阻尼系统.svg",width: 40%), 
    caption: [Spring-damper system]
  )

  *Solution*:Take downward direction as positive,apply force analysis to the system,we have:
  $
  cases(
    M_1 a_1 = -k x_1 - b_1 (v_1 - v_2)\
    M_2 a_2 = f(t)-b_2 v_2 + b_1 (v_1 - v_2)
  )
  $
  where $x_1,x_2$ stands for the displacement of mass $M_1,M_2$,$v_1,v_2$ stands for the velocity of mass $M_1,M_2$ and $a_1,a_2$ stands for the acceleration of mass $M_1,M_2$.
  
  We choose $x_1 = x_1("displacement of mass"),x_2 = x_2("displacement of mass"),x_3 = v_1,x_4 = v_2$as state variables and $y_1 = x_1,y_2 = x_2$ as output variables.Then we have:
  $
  cases(
    accent(x_1,dot) = x_3\
    accent(x_2,dot) = x_4\
    accent(x_3,dot) = -k/M_1 x_1 - b_1/M_1 (x_3 - x_4)\
    accent(x_4,dot) = f(t)/M_2 - b_2/M_2 x_4 + b_1/M_2 (x_3 - x_4)
  )\
  cases(
    y_1 = x_1\
    y_2 = x_2
  )
  $
  Let input $f(t) = u(t)$ and rewrite it as vector form:
  $
  cases(
    vec(delim: "[",accent(x_1,dot),accent(x_2,dot),accent(x_3,dot),accent(x_4,dot)) = mat(delim: "[",0,0,1,0;0,0,0,1;-k/M_1,0,-b_1/M_1,b_1/M_1;0,0,b_1/M_2,-(b_2+b_1)/M_2) vec(delim: "[",x_1,x_2,x_3,x_4) + vec(delim: "[",0,0,0,1/M_2) u(t)\
    vec(delim: "[",y_1,y_2) = mat(delim: "[",1,0,0,0;0,1,0,0) vec(delim: "[",x_1,x_2,x_3,x_4)  
  )
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

+ Given a state space representation,try to find the transfer function of the system.
  $
  cases(
    vec(delim: "[",accent(x_1,dot),accent(x_2,dot),accent(x_3,dot)) = mat(delim: "[",-2,1,0;0,-3,0;0,1,-4) vec(delim: "[",x_1,x_2,x_3) + mat(delim: "[",-1,-1;1,4;2,-3) vec(delim: "[",u_1,u_2)\
    vec(delim: "[",y_1,y_2) = mat(delim: "[",1,1,1;-2,-1,0) vec(delim: "[",x_1,x_2,x_3)
  )
  $
  *Solution*:
  $
  bold(G)(s) = (bold(Y)(s))/(bold(U)(s)) &= bold(C)(s bold(I)- bold(A))^(-1) bold(B) + bold(D)\
  &= mat(delim: "[",1,1,1;-2,-1,0) mat(delim: "[",s+2,-1,0;0,s+3,0;0,-1,s+4)^(-1) mat(delim: "[",-1,-1;1,4;2,-3)\
  &= 
  $