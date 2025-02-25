#set text(size: 10pt)
= Total Energies of O+:
#align(center)[
#table(
  columns: (auto, auto, auto, auto, auto, auto),
  stroke: (x: none, y: none),
  row-gutter: 0.2em,
  column-gutter: 3.5pt,
  align: (left, center+horizon, center+horizon, center+horizon, center+horizon, center+horizon),
  inset: 2pt,
  table.hline(stroke: 1pt),
  table.header(
  [#box(height: 2em, [])],
  [#box(height: 2em, [aug-cc-pV2Z])],
  [#box(height: 2em, [aug-cc-pV3Z])],
  [#box(height: 2em, [aug-cc-pV4Z])],
  [#box(height: 2em, [aug-cc-pV5Z])],
  [#box(height: 2em, [aug-cc-pV6Z])],
),
  table.hline(stroke: 1pt),
  pad(top: 1em, [UHF]), pad(top: 1em, [*-74.353 817 76*]), pad(top: 1em, [*-74.370 943 39*]), pad(top: 1em, [*-74.375 804 10*]), pad(top: 1em, [*-74.376 981 77*]), pad(top: 1em, [*-74.818 949 07*]),
  [CCSD],             [*-74.481 811 56*], [*-74.539 829 78*], [*-74.556 053 10*], [], [],
  [CCSD(T)],          [*-74.482 690 78*], [*-74.541 779 41*], [*-74.558 291 59*], [], [],
  [CCSDT],            [*-74.482 816 42*], [*-74.541 994 01*], [*-74.558 486 07*], [], [],
  [CCSDT(Q)/B],       [*-74.482 832 04*], [*-74.542 021 62*], [*-74.558 517 82*], [], [],
  [CCSDTQ],           [*-74.482 834 68*], [*-74.542 023 23*], [*-74.558 519 66*], [], [],
  [CCSDTQ(P)/B],      [*-74.482 834 57*], [*-74.542 023 28*], [*-74.558 519 71*], [], [],
  [CCSDTQP],          [*-74.482 834 61*], [*-74.542 023 38*], [*-74.558 519 87*], [], [],
  [CCSDTQP(H)/B],     [*-74.482 834 61*], [*-74.542 023 38*], [], [], [],
  [CCSDTQPH],         [*-74.482 834 63*], [*-74.542 023 38*], [], [], [],
  [CCSDTQPH(S)/B],    [*-74.482 834 63*], [], [], [], [],
  pad(bottom: 1em, [FCI = CCSDTQPHS]), pad(bottom: 1em, [*-74.482 834 63*]),pad(bottom: 1em, []), pad(bottom: 1em, []), pad(bottom: 1em, []), pad(bottom: 1em, []),
  table.hline(stroke: 1pt),
)]