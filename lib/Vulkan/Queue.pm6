unit class Vulkan::Queue is repr('CPointer');

use NativeCall;

our enum Flags (
    Graphics => 0x00000001,
    Compute => 0x00000002,
    Transfer => 0x00000004,
    SparseBinding => 0x00000008
);

our class FamilyProperties is repr('CStruct') {
    has uint32 $.flags;
    has uint32 $.count;
    has uint32 $.timestamp-valid-bits;
    has Vulkan::Extent::3D $.min-image-transfer-granularity;
}

our class CreateInfo is repr('CStruct') {
    has Vulkan::StructureType $.type;
    has Pointer $.next;
    has uint32 $.flags;
    has uint32 $.family-index;
    has uint32 $.count;
    has Pointer[num32] $.priorities;
}
