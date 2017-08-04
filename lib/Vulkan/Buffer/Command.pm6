unit class Vulkan::Command::Buffer is repr('CPointer');

use NativeClass;

our module Flags {
    our enum Usage (
        OneTimeSubmit => 0x00000001,
        RenderPassContinue => 0x00000002,
        SimultaneousUse => 0x00000004
    );
    
    our enum Reset (
        ReleaseResources => 0x00000001
    );
}

our enum Level (
    Primary => 0,
    Secondary => 1
);

our enum SubpassContents (
    Inline => 0,
    SecondaryCommandBuffers => 1
);
