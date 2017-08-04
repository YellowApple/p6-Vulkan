unit class Vulkan::Device::Physical is repr('CPointer');

use NativeCall;

our enum Type (
    Other => 0,
    IntegratedGPU => 1,
    DiscreteGPU => 2,
    VirtualGPU => 3,
    CPU => 4
);

our class Features is repr('CStruct') {
    has Bool $.robust-buffer-access;
    has Bool $.full-draw-index-uint32;
    has Bool $.image-cube-array;
    has Bool $.independent-blend;
    has Bool $.geometry-shader;
    has Bool $.tessellation-shader;
    has Bool $.sample-rate-shading;
    has Bool $.dual-source-blend;
    has Bool $.logic-operator;
    has Bool $.multi-draw-indirect;
    has Bool $.draw-indirect-first-instance;
    has Bool $.depth-clamp;
    has Bool $.depth-bias-clamp;
    has Bool $.fill-mode-non-solid;
    has Bool $.depth-bounds;
    has Bool $.wide-lines;
    has Bool $.large-points;
    has Bool $.alpha-to-one;
    has Bool $.multi-viewport;
    has Bool $.sampler-anisotropy;
    has Bool $.ETC2-texture-compression;
    has Bool $.ASTC_LDR-texture-compression;
    has Bool $.BC-texture-compression;
    has Bool $.occlusion-query-precise;
    has Bool $.pipeline-statistics-query;
    has Bool $.vertex-pipeline-stores-and-atomics;
    has Bool $.fragment-stores-and-atomics;
    has Bool $.shader-tessellation-and-geometry-point-size;
    has Bool $.shader-image-gather-extended;
    has Bool $.shader-storage-image-extended-formats;
    has Bool $.shader-storage-image-multisample;
    has Bool $.shader-storage-image-read-without-format;
    has Bool $.shader-storage-image-write-without-format;
    has Bool $.shader-uniform-buffer-array-dynamic-indexing;
    has Bool $.shader-sampled-image-array-dynamic-indexing;
    has Bool $.shader-storage-buffer-array-dynamic-indexing;
    has Bool $.shader-storage-image-array-dynamic-indexing;
    has Bool $.clip-distance;
    has Bool $.cull-distance;
    has Bool $.shader-num64;
    has Bool $.shader-int64;
    has Bool $.shader-int32;
    has Bool $.shader-resource-residency;
    has Bool $.shader-resource-min-lod;
    has Bool $.sparse-binding;
    has Bool $.sparse-residency-buffer;
    has Bool $.sparse-residency-image-2d;
    has Bool $.sparse-residency-image-3d;
    has Bool $.sparse-residency-2-samples;
    has Bool $.sparse-residency-4-samples;
    has Bool $.sparse-residency-8-samples;
    has Bool $.sparse-residency-16-samples;
    has Bool $.sparse-residency-aliased;
    has Bool $.variable-multisample-rate;
    has Bool $.inherited-queries;
}
