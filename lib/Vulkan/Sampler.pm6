unit class Vulkan::Sampler is repr('CPointer');
# FIXME: figure out what "non-dispatchable" means and
# why 32-bit platforms apparently need this to be
# represented by a uint64 instead of a real pointer.

use NativeCall;

our enum Filter (
    Nearest => 0,
    Linear => 1
);

our module Mode {
    our enum Mipmap (
        Nearest => 0,
        Linear => 1
    );

    our enum Address (
        Repeat => 0,
        MirroredRepeat => 1,
        ClampToEdge => 2,
        ClampToBorder => 3,
        MirrorClampToEdge => 4
    );
}

our enum BorderColor (
    Float-TransparentBlack => 0,
    Int-TransparentBlack => 1,
    Float-OpaqueBlack => 2,
    Int-OpaqueBlack => 3,
    Float-OpaqueWhite => 4,
    Int-OpaqueWhite => 5
);
