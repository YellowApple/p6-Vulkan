unit class Vulkan::Device::Memory is repr('CPointer');
# FIXME: figure out what "non-dispatchable" means and
# why 32-bit platforms apparently need this to be
# represented by a uint64 instead of a real pointer.

use NativeCall;

our module Flags {
    our enum Property (
        DeviceLocal => 0x00000001,
        HostVisible => 0x00000002,
        HostCoherent => 0x00000004,
        HostCached => 0x00000008,
        LazilyAllocated => 0x00000010
    );
    
    our enum Heap (
        DeviceLocal => 0x00000001,
        Khronos-MultiInstance => 0x00000002
    );
}
