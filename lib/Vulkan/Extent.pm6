unit module Vulkan::Extent;

our class 3D is repr('CStruct') {
    has uint32 $.width;
    has uint32 $.height;
    has uint32 $.depth;
}
