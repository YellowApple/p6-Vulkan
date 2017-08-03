unit module Vulkan::Attachment;

our module Operator {
    our enum Load (
        Load => 0,
        Clear => 1,
        DontCare => 2
    );

    our enum Store (
        Store => 0,
        DontCare => 1
    );
}
