unit class Vulkan::Pool::Command is repr('CPointer');
# FIXME: figure out what "non-dispatchable" means and
# why 32-bit platforms apparently need this to be
# represented by a uint64 instead of a real pointer.

use NativeCall;

our module Flags {
    our enum Create (
        Transient => 0x00000001,
        ResetCommandBuffer => 0x00000002
    );
    
    our enum Reset (
        ReleaseResources => 0x00000001
    );
}
