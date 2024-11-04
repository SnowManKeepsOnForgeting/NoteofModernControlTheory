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
#counter(heading).update(4)

= State Feedback and State Observer

== State Feedback

== State Observer
Given a linear time-invariant system:
$
  dcases(
    xbd = Ab xb + Bb u,
    yb = Cb xb
  )
$

== State Feedback system with State Observer
Given a linear time-invariant system:
$
  dcases(
    xbd = Ab xb + Bb u,
    yb = Cb xb
  )

$
With its state observer:
$
  xbhd = (Ab - G Cb)xbh + Bb u + G y
$

$
  u = V - K xbh
$
We have:
$
dcases(
  xbd = Ab xb - Bb K xbh + Bb V\
  xbhd = G C xb + (A - G C - Bb K) xbh + Bb V\
  y = Cb xb
)
$
Let:
$
  phi(t) = xb(t) - xbh(t)\
  dot(phi)(t) = (Ab  - G Cb) phi(t)
$
Then let:
$
  xbh(t) = xb(t) - phi(t)
  =
$