unit class Vulkan::Device::Physical is repr('CPointer');

use NativeCall;

our enum Type (
  Other => 0,
  IntegratedGPU => 1,
  DiscreteGPU => 2,
  VirtualGPU => 3,
  CPU => 4
);
