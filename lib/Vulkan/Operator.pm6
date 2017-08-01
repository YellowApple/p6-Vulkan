unit module Vulkan::Operator;

our enum Compare (
  Never => 0,
  Less => 1,
  Equal => 2,
  LessOrEqual => 3,
  Greater => 4,
  NotEqual => 5,
  GreaterOrEqual => 6,
  Always => 7
);

our enum Stencil (
  Keep => 0,
  Zero => 1,
  Replace => 2,
  IncrementAndClamp => 3,
  DecrementAndClamp => 4,
  Invert => 5,
  IncrementAndWrap => 6,
  DecrementAndWrap => 7
);

our enum Logic (
  Clear => 0,
  And => 1,
  AndReverse => 2,
  Copy => 3,
  AndInverted => 4,
  NoOp => 5,
  Xor => 6,
  Or => 7,
  Nor => 8,
  Equivalent => 9,
  Invert => 10,
  OrReverse => 11,
  CopyInverted => 12,
  OrInverted => 13,
  Nand => 14,
  Set => 15
)
