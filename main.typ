#import "@preview/ctyp:0.3.0": ctyp
#let (ctypset, cjk) = ctyp()
#let (song, hei, kai, fang) = cjk
#show: ctypset
#outline(
  title: [目录],
  depth: 2,
  indent: auto,
)
#pagebreak()

#include "Lesson1.typ"
#include "Lesson2.typ"