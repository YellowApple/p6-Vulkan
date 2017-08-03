unit class Vulkan::Queue is repr('CPointer');

use NativeCall;

enum Flags (
    Graphics => 0x00000001,
    Compute => 0x00000002,
    Transfer => 0x00000004,
    SparseBinding => 0x00000008
);
