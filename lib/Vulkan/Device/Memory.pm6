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
    
    our enum SparseBind (
        Metadata => 0x00000001
    );
}

our class Type is repr('CStruct') {
    has uint32 $.property-flags;
    has uint32 $.heap-index;
}

our class Heap is repr('CStruct') {
    has uint64 $.size;
    has uint32 $.flags;
}

our class Properties is repr('CStruct') {
    has uint32 $.type-count;
    has CArray[Type] $.types;
    has uint32 $.heap-count;
    has CArray[Heap] $.heaps;
}

our class AllocateInfo is repr('CStruct') {
    has Vulkan::StructureType $.type;
    has Pointer $.next;
    has uint64 $.allocation-size;
    has uint32 $.type-index;
}

our class MappedRange is repr('CStruct') {
    has Vulkan::StructureType $.type;
    has Pointer $.next;
    has Memory $.memory;
    has uint64 $.offset;
    has uint64 $.size;
}

our class Requirements is repr('CStruct') {
    has uint64 $.size;
    has uint64 $.alignment;
    has uint32 $.type-bits;
}
