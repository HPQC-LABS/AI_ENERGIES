#set text(size: 7pt)
= Total Energies of O:
#align(center)[
#table(
  columns: (auto, auto, auto, auto, auto, auto, auto, auto),
  stroke: (x: none, y: none),
  row-gutter: 0.2em,
  column-gutter: 3.5pt,
  align: (left, center+horizon, center+horizon, center+horizon, center+horizon, center+horizon, center+horizon, center+horizon),
  inset: 3pt,
  table.hline(stroke: 1pt),
  table.header(
  [#box(height: 2em, [])],
  [#box(height: 2em, [aug-cc-pCV2Z])],
  [#box(height: 2em, [aug-cc-pCV3Z])],
  [#box(height: 2em, [aug-cc-pCV4Z])],
  [#box(height: 2em, [aug-cc-pCV5Z])],
  [#box(height: 2em, [aug-cc-pCV6Z])],
  [#box(height: 2em, [aug-cc-pCV7Z])],
  [#box(height: 2em, [aug-cc-pCV8Z])],
),
  table.hline(stroke: 1pt),
  pad(top: 1em, [UHF]), pad(top: 1em, [*-74.796 718 39*]), pad(top: 1em, [*-74.813 095 62*]), pad(top: 1em, [*-74.817 689 84*]), pad(top: 1em, [*-74.818 844 59*]), pad(top: 1em, [*-74.818 949 07*]), pad(top: 1em, [*-74.818 977 27*]), pad(top: 1em, [*-74.818 979 42*]),
  [CCSD],             [*-74.963 321 71*], [*-75.031 929 31*], [*-75.051 321 99*], [*-75.057 488 48*],             [*-75.059 306 76*], [*-75.060 624 40*], [*-75.061 137 72*], 
  [CCSD(T)],          [*-74.964 542 90*], [*-75.035 772 11*], [*-75.053 445 10*], [*-75.058 937 45*],             [*-75.062 712 94*], [*-75.058 428 31*], [*-75.059 453 98*],
  [CCSDT],            [*-74.966 288 38*], [*-75.036 120 56*], [*-75.056 006 46*], [*-75.062 252 43*],             [*-75.064 106 43*], [*-75.065 384 95*], [*-75.065 908 30*],
  [CCSDT(Q)/B],       [*-74.966 471 22*], [*-75.036 195 95*], [*-75.056 183 09*], [*-75.062 441 19*],             [*-75.064 264 13*], [--],               [--],
  [CCSDTQ],           [*-74.966 441 22*], [*-75.036 199 10*], [*-75.056 173 82*], [#highlight[*-75.062 424 00*]], [--],               [--],               [--],
  [CCSDTQ(P)/B],      [*-74.966 446 07*], [*-75.036 196 64*], [*-75.056 176 92*], [--],                           [--],               [--],               [--],
  [CCSDTQP],          [*-74.966 445 87*], [*-75.036 198 65*], [--],               [--],                           [--],               [--],               [--],
  [CCSDTQP(H)/B],     [*-74.966 445 91*], [--],               [--],               [--],                           [--],               [--],               [--],
  [CCSDTQPH],         [*-74.966 445 91*], [--],               [--],               [--],                           [--],               [--],               [--],
  [CCSDTQPH(S)/B],    [*-74.966 445 91*], [--],               [--],               [--],                           [--],               [--],               [--],
  [CCSDTQPHS],        [*-74.966 445 92*], [--],               [--],               [--],                           [--],               [--],               [--],
  [CCSDTQPHS(O)/B],   [*-74.966 445 92*], [--],               [--],               [--],                           [--],               [--],               [--], 
  pad(bottom: 1em, [FCI = CCSDTQPHSO]), pad(bottom: 1em, [*-74.966 445 92*]),pad(bottom: 1em, [--]), pad(bottom: 1em, [--]), pad(bottom: 1em, [--]), pad(bottom: 1em, [--]), pad(bottom: 1em, [--]), pad(bottom: 1em, [--]),
  table.hline(stroke: 1pt),
)]

#text(size: 1em)[Note: The results for aug-cc-pCV3Z were taken from CFOUR-MRCC with cctol=10]
