unit class Vulkan::Image::View is repr('CPointer');
# FIXME: figure out what "non-dispatchable" means and
# why 32-bit platforms apparently need this to be
# represented by a uint64 instead of a real pointer.

use NativeCall;

our enum Type (
  1D => 0,
  2D => 1,
  3D => 2,
  Cube => 3,
  1DArray => 4,
  2DArray => 5,
  CubeArray => 6
);
