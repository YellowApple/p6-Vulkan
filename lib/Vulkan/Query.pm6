unit module Vulkan::Query;

our module Flags {
    our enum PipelineStatistic (
        InputAssemblyVertices => 0x00000001,
        InputAssemblyPrimitives => 0x00000002,
        VertexShaderInvocations => 0x00000004,
        GeometryShaderInvocations => 0x00000008,
        GeometryShaderPrimitives => 0x00000010,
        ClippingInvocations => 0x00000020,
        ClippingPrimitives => 0x00000040,
        FragmentShaderInvocations => 0x00000080,
        TessellationControlShaderPatches => 0x00000100,
        TessellationEvaluationShaderInvocations => 0x00000200,
        ComputeShaderInvocations => 0x00000400
    );
    
    our enum Result (
        64Bit => 0x00000001,
        Wait => 0x00000002,
        WithAvailability => 0x00000004,
        Partial => 0x00000008
    );
    
    our enum Control (
        Precise => 0x00000001
    );
}

our enum Type (
    Occlusion => 0,
    PipelineStatistics => 1,
    Timestamp => 2
);
