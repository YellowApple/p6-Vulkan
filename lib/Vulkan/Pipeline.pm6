unit class Vulkan::Pipeline is repr('CPointer');
# FIXME: figure out what "non-dispatchable" means and
# why 32-bit platforms apparently need this to be
# represented by a uint64 instead of a real pointer.

use NativeCall;

our enum PrimitiveTopology (
  PointList => 0,
  LineList => 1,
  LineStrip => 2,
  TriangleList => 3,
  TriangleStrip => 4,
  TriangleFan => 5,
  LineListWithAdjacency => 6,
  LineStripWithAdjacency => 7,
  TriangleListWithAdjacency => 8,
  TriangleStripWithAdjacency => 9,
  PatchList => 10
);

our enum PolygonMode (
  Fill => 0,
  Line => 1,
  Point => 2,
  Nvidia-FillRectangle => 1000153000
);

our enum FrontFace (
  CounterClockwise => 0,
  Clockwise => 1
);
