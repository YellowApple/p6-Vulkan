unit class Vulkan::Buffer is repr('CPointer');
# FIXME: figure out what "non-dispatchable" means and
# why 32-bit platforms apparently need this to be
# represented by a uint64 instead of a real pointer.

use NativeCall;

our module Flags {
    our enum Create (
        SparseBinding => 0x00000001,
        SparseResidency => 0x00000002,
        SparseAliased => 0x00000004
    );
    
    our enum Usage (
        TransferSource => 0x00000001,
        TransferDest => 0x00000002,
        UniformTexelBuffer => 0x00000004,
        StorageTexelBuffer => 0x00000008,
        UniformBuffer => 0x00000010,
        StorageBuffer => 0x00000020,
        IndexBuffer => 0x00000040,
        VertexBuffer => 0x00000080,
        IndirectBuffer => 0x00000100
    );
}

our enum IndexType (
    UInt16 => 0,
    UInt32 => 1
);
