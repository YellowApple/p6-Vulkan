unit class Vulkan::Command::Buffer is repr('CPointer');

use NativeClass;

our enum Level (
    Primary => 0,
    Secondary => 1
);

our enum SubpassContents (
    Inline => 0,
    SecondaryCommandBuffers => 1
);
