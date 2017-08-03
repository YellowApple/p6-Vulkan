unit class Vulkan::Pipeline is repr('CPointer');
# FIXME: figure out what "non-dispatchable" means and
# why 32-bit platforms apparently need this to be
# represented by a uint64 instead of a real pointer.

use NativeCall;

our module Flags {
    our enum Stage (
        TopOfPipe => 0x00000001,
        DrawIndirect => 0x00000002,
        VertexInput => 0x00000004,
        VertexShader => 0x00000008,
        TessellationControlShader => 0x00000010,
        TessellationEvaluationShader => 0x00000020,
        GeometryShader => 0x00000040,
        FragmentShader => 0x00000080,
        EarlyFragmentTests => 0x00000100,
        LateFragmentTests => 0x00000200,
        ColorAttachmentOutput => 0x00000400,
        ComputeShader => 0x00000800,
        Transfer => 0x00001000,
        BottomOfPipe => 0x00002000,
        Host => 0x00004000,
        AllGraphics => 0x00008000,
        AllCommands => 0x00010000,
        Nvidia-CommandProcess => 0x00020000
    );
}

our enum PrimitiveTopology (
    PointList => 0,
    LineList => 1,
    LineStrip => 2,
    TriangleList => 3,
    TriangleStrip => 4,
    TriangleFan => 5,
    LineListWithAdjacency => 6,
    LineStripWithAdjacency => 7,
    TriangleListWithAdjacency => 8,
    TriangleStripWithAdjacency => 9,
    PatchList => 10
);

our enum PolygonMode (
    Fill => 0,
    Line => 1,
    Point => 2,
    Nvidia-FillRectangle => 1000153000
);

our enum FrontFace (
    CounterClockwise => 0,
    Clockwise => 1
);

our module Operator {
    our enum Compare (
        Never => 0,
        Less => 1,
        Equal => 2,
        LessOrEqual => 3,
        Greater => 4,
        NotEqual => 5,
        GreaterOrEqual => 6,
        Always => 7
    );
    
    our enum Stencil (
        Keep => 0,
        Zero => 1,
        Replace => 2,
        IncrementAndClamp => 3,
        DecrementAndClamp => 4,
        Invert => 5,
        IncrementAndWrap => 6,
        DecrementAndWrap => 7
    );
    
    our enum Logic (
        Clear => 0,
        And => 1,
        AndReverse => 2,
        Copy => 3,
        AndInverted => 4,
        NoOp => 5,
        Xor => 6,
        Or => 7,
        Nor => 8,
        Equivalent => 9,
        Invert => 10,
        OrReverse => 11,
        CopyInverted => 12,
        OrInverted => 13,
        Nand => 14,
        Set => 15
    );
    
    our enum Blend (
        Add => 0,
        Subtract => 1,
        ReverseSubtract => 2,
        Min => 3,
        Max => 4,
        Ext-Zero => 1000148000,
        Ext-Source => 1000148001,
        Ext-Dest => 1000148002,
        Ext-SourceOver => 1000148003,
        Ext-DestOver => 1000148004,
        Ext-SourceIn => 1000148005,
        Ext-DestIn => 1000148006,
        Ext-SourceOut => 1000148007,
        Ext-DestOut => 1000148008,
        Ext-SourceAtop => 1000148009,
        Ext-DestAtop => 1000148010,
        Ext-Xor => 1000148011,
        Ext-Multiply => 1000148012,
        Ext-Screen => 1000148013,
        Ext-Overlay => 1000148014,
        Ext-Darken => 1000148015,
        Ext-Lighten => 1000148016,
        Ext-ColorDodge => 1000148017,
        Ext-ColorBurn => 1000148018,
        Ext-HardLight => 1000148019,
        Ext-SoftLight => 1000148020,
        Ext-Difference => 1000148021,
        Ext-Exclusion => 1000148022,
        Ext-Invert => 1000148023,
        Ext-InvertRGB => 1000148024,
        Ext-LinearDodge => 1000148025,
        Ext-LinearBurn => 1000148026,
        Ext-VividLight => 1000148027,
        Ext-LinearLight => 1000148028,
        Ext-PinLight => 1000148029,
        Ext-HardMix => 1000148030,
        Ext-HSLHue => 1000148031,
        Ext-HSLSaturation => 1000148032,
        Ext-HSLColor => 1000148033,
        Ext-HSLLuminosity => 1000148034,
        Ext-Plus => 1000148035,
        Ext-PlusClamped => 1000148036,
        Ext-PlusClampedAlpha => 1000148037,
        Ext-Minus => 1000148039,
        Ext-MinusClamped => 1000148040,
        Ext-Contrast => 1000148041,
        Ext-InvertOVG => 1000148042,
        Ext-Red => 1000148043,
        Ext-Green => 1000148044,
        Ext-Blue => 1000148045
    );
}

our module Factor {
    our enum Blend (
        Zero => 0,
        One => 1,
        SourceColor => 2,
        OneMinusSourceColor => 3,
        DestColor => 4,
        OneMinusDestColor => 5,
        SourceAlpha => 6,
        OneMinusSourceAlpha => 7,
        DestAlpha => 8,
        OneMinusDestAlpha => 9,
        ConstantColor => 10,
        OneMinusConstantColor => 11,
        ConstantAlpha => 12,
        OneMinusConstantAlpha => 13,
        SourceAlphaSaturate => 14,
        Source1Color => 15,
        OneMinusSource1Color => 16,
        Source1Alpha => 17,
        OneMinusSource1Alpha => 18
    );
}

our enum DynamicState (
    Viewport => 0,
    Scissor => 1,
    LineWidth => 2,
    DepthBias => 3,
    BlendConstants => 4,
    DepthBounds => 5,
    StencilCompareMask => 6,
    StencilWriteMask => 7,
    StencilReference => 8,
    Nvidia-ViewportWScaling => 1000087000,
    Ext-DiscardRectangle => 1000099000
);
