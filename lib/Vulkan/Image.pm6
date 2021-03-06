unit class Vulkan::Image is repr('CPointer');
# FIXME: figure out what "non-dispatchable" means and
# why 32-bit platforms apparently need this to be
# represented by a uint64 instead of a real pointer.

use NativeCall;

our module Flags {
    our enum FormatFeature (
        SampledImage => 0x00000001,
        StorageImage => 0x00000002,
        StorageImageAtomic => 0x00000004,
        UniformTexelBuffer => 0x00000008,
        StorageTexelBuffer => 0x00000010,
        StorageTexelBufferAtomic => 0x00000020,
        VertexBuffer => 0x00000040,
        ColorAttachment => 0x00000080,
        ColorAttachmentBlend => 0x00000100,
        DepthStencilAttachment => 0x00000200,
        BlitSource => 0x00000400,
        BlitDest => 0x00000800,
        SampledImageFilterLinear => 0x00001000,
        SampledImageFilterCubic => 0x00002000,
        Khronos-TransferSource => 0x00004000,
        Khronos-TransferDest => 0x00008000
        Ext-SampledImageFilterMinMax => 0x00010000
    );
    
    our enum Usage (
        TransferSource => 0x00000001,
        TransferDest => 0x00000002,
        Sampled => 0x00000004,
        Storage => 0x00000008,
        ColorAttachment => 0x00000010,
        DepthStencilAttachment => 0x00000020,
        TransientAttachment => 0x00000040,
        InputAttachment => 0x00000080
    );
    
    our enum Create (
        SparseBinding => 0x00000001,
        SparseResidency => 0x00000002,
        SparseAliased => 0x00000004,
        MutableFormat => 0x00000008,
        CubeCompatible => 0x00000010,
        Khronos-2DArrayCompatible => 0x00000020,
        Khronos-BindSfr => 0x00000040
    );
    
    our enum SampleCount (
        1Bit => 0x00000001,
        2Bit => 0x00000002,
        4Bit => 0x00000004,
        8Bit => 0x00000008,
        16Bit => 0x00000010,
        32Bit => 0x00000020,
        64Bit => 0x00000040
    );
    
    our enum Aspect (
        Color => 0x00000001,
        Depth => 0x00000002,
        Stencil => 0x00000004,
        Metadata => 0x00000008
    );
    
    our enum SparseFormat (
        SingleMiptail => 0x00000001,
        AlignedMipSize => 0x00000002,
        NonstandardBlockSize => 0x00000004
    );
}

our enum Format (
    Undefined => 0,
    R4G4-Unorm-Pack8 => 1,
    R4G4B4A4-UNorm-Pack16 => 2,
    B4G4R4A4-UNorm-Pack16 => 3,
    R5G6B5-UNorm-Pack16 => 4,
    B5G6R5-UNorm-Pack16 => 5,
    R5G5B5A1-UNorm-Pack16 => 6,
    B5G5R5A1-UNorm-Pack16 => 7,
    A1R5G5B5-UNorm-Pack16 => 8,
    R8-UNorm => 9,
    R8-SNorm => 10,
    R8-UScaled => 11,
    R8-SScaled => 12,
    R8-UInt => 13,
    R8-SInt => 14,
    R8-SRGB => 15,
    R8G8-UNorm => 16,
    R8G8-SNorm => 17,
    R8G8-UScaled => 18,
    R8G8-SScaled => 19,
    R8G8-UInt => 20,
    R8G8-SInt => 21,
    R8G8-SRGB => 22,
    R8G8B8-UNorm => 23,
    R8G8B8-SNorm => 24,
    R8G8B8-UScaled => 25,
    R8G8B8-SScaled => 26,
    R8G8B8-UInt => 27,
    R8G8B8-SInt => 28,
    R8G8B8-SRGB => 29,
    B8G8R8-UNorm => 30,
    B8G8R8-SNorm => 31,
    B8G8R8-UScaled => 32,
    B8G8R8-SScaled => 33,
    B8G8R8-UInt => 34,
    B8G8R8-SInt => 35,
    B8G8R8-SRGB => 36,
    R8G8B8A8-UNorm => 37,
    R8G8B8A8-SNorm => 38,
    R8G8B8A8-UScaled => 39,
    R8G8B8A8-SScaled => 40,
    R8G8B8A8-UInt => 41,
    R8G8B8A8-SInt => 42,
    R8G8B8A8-SRGB => 43,
    B8G8R8A8-UNorm => 44,
    B8G8R8A8-SNorm => 45,
    B8G8R8A8-UScaled => 46,
    B8G8R8A8-SScaled => 47,
    B8G8R8A8-UInt => 48,
    B8G8R8A8-SInt => 49,
    B8G8R8A8-SRGB => 50,
    A8B8G8R8-UNorm-Pack32 => 51,
    A8B8G8R8-SNorm-Pack32 => 52,
    A8B8G8R8-UScaled-Pack32 => 53,
    A8B8G8R8-SScaled-Pack32 => 54,
    A8B8G8R8-UInt-Pack32 => 55,
    A8B8G8R8-SInt-Pack32 => 56,
    A8B8G8R8-SRGB-Pack32 => 57,
    A2R10G10B10-UNorm-Pack32 => 58,
    A2R10G10B10-SNorm-Pack32 => 59,
    A2R10G10B10-UScaled-Pack32 => 60,
    A2R10G10B10-SScaled-Pack32 => 61,
    A2R10G10B10-UInt-Pack32 => 62,
    A2R10G10B10-SInt-Pack32 => 63,
    A2B10G10R10-UNorm-Pack32 => 64,
    A2B10G10R10-SNorm-Pack32 => 65,
    A2B10G10R10-UScaled-Pack32 => 66,
    A2B10G10R10-SScaled-Pack32 => 67,
    A2B10G10R10-UInt-Pack32 => 68,
    A2B10G10R10-SInt-Pack32 => 69,
    R16-UNorm => 70,
    R16-SNorm => 71,
    R16-UScaled => 72,
    R16-SScaled => 73,
    R16-UInt => 74,
    R16-SInt => 75,
    R16-SFloat => 76,
    R16G16-UNorm => 77,
    R16G16-SNorm => 78,
    R16G16-UScaled => 79,
    R16G16-SScaled => 80,
    R16G16-UInt => 81,
    R16G16-SInt => 82,
    R16G16-SFloat => 83,
    R16G16B16-UNorm => 84,
    R16G16B16-SNorm => 85,
    R16G16B16-UScaled => 86,
    R16G16B16-SScaled => 87,
    R16G16B16-UInt => 88,
    R16G16B16-SInt => 89,
    R16G16B16-SFloat => 90,
    R16G16B16A16-UNorm => 91,
    R16G16B16A16-SNorm => 92,
    R16G16B16A16-UScaled => 93,
    R16G16B16A16-SScaled => 94,
    R16G16B16A16-UInt => 95,
    R16G16B16A16-SInt => 96,
    R16G16B16A16-SFloat => 97,
    R32-UInt => 98,
    R32-SInt => 99,
    R32-SFloat => 100,
    R32G32-UInt => 101,
    R32G32-SInt => 102,
    R32G32-SFloat => 103,
    R32G32B32-UInt => 104,
    R32G32B32-SInt => 105,
    R32G32B32-SFloat => 106,
    R32G32B32A32-UInt => 107,
    R32G32B32A32-SInt => 108,
    R32G32B32A32-SFloat => 109,
    R64-UInt => 110,
    R64-SInt => 111,
    R64-SFloat => 112,
    R64G64-UInt => 113,
    R64G64-SInt => 114,
    R64G64-SFloat => 115,
    R64G64B64-UInt => 116,
    R64G64B64-SInt => 117,
    R64G64B64-SFloat => 118,
    R64G64B64A64-UInt => 119,
    R64G64B64A64-SInt => 120,
    R64G64B64A64-SFloat => 121,
    B10G11R11-UFloat-Pack32 => 122,
    E5B9G9R9-UFloat-Pack32 => 123,
    D16-UNorm => 124,
    X8-D24-UNorm-Pack32 => 125,
    D32-SFloat => 126,
    S8-UInt => 127,
    D16-UNorm-S8-UInt => 128,
    D24-UNorm-S8-UInt => 129,
    D32-SFloat-S8-UInt => 130,
    BC1-RGB-UNorm-Block => 131,
    BC1-RGB-SRGB-Block => 132,
    BC1-RGBA-UNorm-Block => 133,
    BC1-RGBA-SRGB-Block => 134,
    BC2-UNorm-Block => 135,
    BC2-SRGB-Block => 136,
    BC3-UNorm-Block => 137,
    BC3-SRGB-Block => 138,
    BC4-UNorm-Block => 139,
    BC4-SNorm-Block => 140,
    BC5-UNorm-Block => 141,
    BC5-SNorm-Block => 142,
    BC6H-UFloat-Block => 143,
    BC6H-SFloat-Block => 144,
    BC7-UNorm-Block => 145,
    BC7-SRGB-Block => 146,
    ETC2-R8G8B8-UNorm-Block => 147,
    ETC2-R8G8B8-SRGB-Block => 148,
    ETC2-R8G8B8A1-UNorm-Block => 149,
    ETC2-R8G8B8A1-SRGB-Block => 150,
    ETC2-R8G8B8A8-UNorm-Block => 151,
    ETC2-R8G8B8A8-SRGB-Block => 152,
    EAC-R11-UNorm-Block => 153,
    EAC-R11-SNorm-Block => 154,
    EAC-R11G11-UNorm-Block => 155,
    EAC-R11G11-SNorm-Block => 156,
    ASTC-4x4-UNorm-Block => 157,
    ASTC-4x4-SRGB-Block => 158,
    ASTC-5x4-UNorm-Block => 159,
    ASTC-5x4-SRGB-Block => 160,
    ASTC-5x5-UNorm-Block => 161,
    ASTC-5x5-SRGB-Block => 162,
    ASTC-6x5-UNorm-Block => 163,
    ASTC-6x5-SRGB-Block => 164,
    ASTC-6x6-UNorm-Block => 165,
    ASTC-6x6-SRGB-Block => 166,
    ASTC-8x5-UNorm-Block => 167,
    ASTC-8x5-SRGB-Block => 168,
    ASTC-8x6-UNorm-Block => 169,
    ASTC-8x6-SRGB-Block => 170,
    ASTC-8x8-UNorm-Block => 171,
    ASTC-8x8-SRGB-Block => 172,
    ASTC-10x5-UNorm-Block => 173,
    ASTC-10x5-SRGB-Block => 174,
    ASTC-10x6-UNorm-Block => 175,
    ASTC-10x6-SRGB-Block => 176,
    ASTC-10x8-UNorm-Block => 177,
    ASTC-10x8-SRGB-Block => 178,
    ASTC-10x10-UNorm-Block => 179,
    ASTC-10x10-SRGB-Block => 180,
    ASTC-12x10-UNorm-Block => 181,
    ASTC-12x10-SRGB-Block => 182,
    ASTC-12x12-UNorm-Block => 183,
    ASTC-12x12-SRGB-Block => 184,
    Imagination-PVRTC1-2BPP-UNorm-Block => 1000054000,
    Imagination-PVRTC1-4BPP-UNorm-Block => 1000054001,
    Imagination-PVRTC2-2BPP-UNorm-Block => 1000054002,
    Imagination-PVRTC2-4BPP-UNorm-Block => 1000054003,
    Imagination-PVRTC1-2BPP-SRGB-Block => 1000054004,
    Imagination-PVRTC1-4BPP-SRGB-Block => 1000054005,
    Imagination-PVRTC2-2BPP-SRGB-Block => 1000054006,
    Imagination-PVRTC2-4BPP-SRGB-Block => 1000054007
);

our class FormatProperties is repr('CStruct') {
    has uint32 $.linear-tiling-features;
    has uint32 $.optimal-tiling-features;
    has uint32 $.buffer-features;
}

our class ImageFormatProperties is repr('CStruct') {
    has Vulkan::Extent::3D $.max-extent;
    has uint32 $.max-mip-levels;
    has uint32 $.max-array-layers;
    has uint32 $.sample-counts;
    has uint64 $.max-resource-size;
}

our class SparseImageFormatProperties is repr('CStruct') {
    has uint32 $.aspect-mask;
    has Vulkan::Extent::3D $.granularity;
    has uint32 $.flags;
}

our enum Type (
    1D => 0,
    2D => 1,
    3D => 2
);

our enum Tiling (
    Optimal => 0,
    Linear => 1
);

our enum Layout (
    Undefined => 0,
    General => 1,
    ColorAttachmentOptimal => 2,
    DepthStencilAttachmentOptimal => 3,
    DepthStencilReadOnlyOptimal => 4,
    ShaderReadOnlyOptimal => 5,
    TransferSourceOptimal => 6,
    TransferDestOptimal => 7,
    Preinitialized => 8,
    Khronos-PresentSource => 1000001002,
    Khronos-SharedPresent => 1000111000
);

our class SparseMemoryRequirements is repr('CStruct') {
    has SparseImageFormatProperties $.format-properties;
    has uint32 $.mip-tail-first-lod;
    has uint64 $.mip-tail-size;
    has uint64 $.mip-tail-offset;
    has uint64 $.mip-tail-stride;
}
