unit class Vulkan::Descriptor::Set::Layout is repr('CPointer');
# FIXME: figure out what "non-dispatchable" means and
# why 32-bit platforms apparently need this to be
# represented by a uint64 instead of a real pointer.

use NativeCall;

our module Flags {
    our enum Create (
        Khronos-PushDescriptor
    );
}
