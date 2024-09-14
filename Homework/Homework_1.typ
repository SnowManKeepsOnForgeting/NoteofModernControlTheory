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

  *Solution*: