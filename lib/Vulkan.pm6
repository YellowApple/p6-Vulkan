unit module Vulkan;

constant LODClampNone = 1000.0;
constant RemainingMipLevels = uint32.Range.max;
constant RemainingArrayLayers = uint32.Range.max;
constant WholeSize = uint64.Range.max;
constant AttachmentUnused = uint32.Range.max;
constant QueueFamilyIgnored = uint32.Range.max;
constant SubpassExternal = uint32.Range.max;
constant MaxPhysicalDeviceNameSize = 256;
constant UUIDSize = 16;
constant MaxMemoryTypes = 32;
constant MaxMemoryHeaps = 16;
constant MaxExtensionNameSize = 256;
constant MaxDescriptionSize = 256;

our module Flags {
    our enum Read (
        IndirectCommand => 0x00000001,
        Index => 0x00000002,
        VertexAttribute => 0x00000004,
        Uniform => 0x00000008,
        InputAttachment => 0x00000010,
        Shader => 0x00000020,
        ColorAttachment => 0x00000080,
        DepthStencil => 0x00000200,
        Transfer => 0x00000800,
        Host => 0x00002000,
        Memory => 0x00008000,
        Nvidia-CommandProcess => 0x00020000,
        Ext-ColorAttachmentNoncoherent => 0x00080000
    );
    
    our enum Write (
        Shader => 0x00000040,
        ColorAttachment => 0x00000100,
        DepthStencil => 0x00000400,
        Transfer => 0x00001000,
        Host => 0x00004000,
        Memory => 0x00010000,
        Nvidia-CommandProcess => 0x00040000
    );
    
    our enum Dependency (
        ByRegion => 0x00000001,
        Khronos-ViewLocal => 0x00000002,
        Khronos-DeviceGroup => 0x00000004
    );
}

our enum ObjectType (
    Unknown => 0,
    Instance => 1,
    PhysicalDevice => 2,
    Device => 3,
    Queue => 4,
    Semaphore => 5,
    CommandBuffer => 6,
    Fence => 7,
    DeviceMemory => 8,
    Buffer => 9,
    Image => 10,
    Event => 11,
    QueryPool => 12,
    BufferView => 13,
    ImageView => 14,
    ShaderModule => 15,
    PipelineCache => 16,
    PipelineLayout => 17,
    RenderPass => 18,
    Pipeline => 19,
    DescriptorSetLayout => 20,
    Sampler => 21,
    DescriptorPool => 22,
    DescriptorSet => 23,
    Framebuffer => 24,
    CommandPool => 25,
    Khronos-Surface => 1000000000,
    Khronos-Swapchain => 1000001000,
    Khronos-Display => 1000002000,
    Khronos-DisplayMode => 1000002001,
    Ext-DebugReportCallback => 1000011000,
    Khronos-DescriptorUpdateTemplate => 1000085000,
    Nvidia-ObjectTable => 1000086001
);

our enum StructureType (
    ApplicationInfo => 0,
    InstanceCreateInfo => 1,
    DeviceQueueCreateInfo => 2,
    DeviceCreateInfo => 3,
    SubmitInfo => 4,
    MemoryAllocateInfo => 5,
    MappedMemoryRange => 6,
    BindSparseInfo => 7,
    FenceCreateInfo => 8,
    SemaphoreCreateInfo => 9,
    EventCreateInfo => 10,
    QueryPoolCreateInfo => 11,
    BufferCreateInfo => 12,
    BufferViewCreateInfo => 13,
    ImageCreateInfo => 14,
    ImageViewCreateInfo => 15,
    ShaderModuleCreateInfo => 16,
    PipelineCacheCreateInfo => 17,
    PipelineShaderStageCreateInfo => 18,
    PipelineVertexInputStateCreateInfo => 19,
    PipelineInputAssemblyStateCreateInfo => 20,
    PipelineTessellationStateCreateInfo => 21,
    PipelineViewportStateCreateInfo => 22,
    PipelineRasterizationStateCreateInfo => 23,
    PipelineMultisampleStateCreateInfo => 24,
    PipelineDepthStencilStateCreateInfo => 25,
    PipelineColorBlendStateCreateInfo => 26,
    PipelineDynamicStateCreateInfo => 27,
    GraphicsPipelineCreateInfo => 28,
    ComputePipelineCreateInfo => 29,
    PipelineLayoutCreateInfo => 30,
    SamplerCreateInfo => 31,
    DescriptorSetLayoutCreateInfo => 32,
    DescriptorPoolCreateInfo => 33,
    DescriptorSetAllocateInfo => 34,
    WriteDescriptorSet => 35,
    CopyDescriptorSet => 36,
    FramebufferCreateInfo => 37,
    RenderPassCreateInfo => 38,
    CommandPoolCreateInfo => 39,
    CommandBufferAllocateInfo => 40,
    CommandBufferInheritanceInfo => 41,
    CommandBufferBeginInfo => 42,
    RenderPassBeginInfo => 43,
    BufferMemoryBarrier => 44,
    ImageMemoryBarrier => 45,
    MemoryBarrier => 46,
    LoaderInstanceCreateInfo => 47,
    LoaderDeviceCreateInfo => 48,
    Khronos-SwapchainCreateInfo => 1000001000,
    Khronos-PresentInfo => 1000001001,
    Khronos-DisplayModeCreateInfo => 1000002001,
    Khronos-DisplayPresentInfo => 1000003000,
    Khronos-XLibSurfaceCreateInfo => 1000004000,
    Khronos-XCBSurfaceCreateInfo => 1000005000,
    Khronos-WaylandSurfaceCreateInfo => 1000006000,
    Khronos-MirSurfaceCreateInfo => 1000007000,
    Khronos-AndroidSurfaceCreateInfo => 1000008000,
    Khronos-Win32SurfaceCreateInfo => 1000009000,
    Ext-DebugReportCallbackCreateInfo => 1000011000,
    AMD-PipelineRasterizationStateRasterizationOrder => 1000018000,
    Ext-DebugMarkerObjectNameInfo => 1000022000,
    Ext-DebugMarkerObjectTagInfo => 1000022001,
    Ext-DebugMarkerMarkerInfo => 1000022002,
    Nvidia-DedicatedAllocationImageCreateInfo => 1000026000,
    Nvidia-DedicatedAllocationBufferCreateInfo => 1000026001,
    Nvidia-DedicatedAllocationMemoryAllocateInfo => 1000026002,
    AMD-TextureLODGatherFormatProperties => 1000041000,
    Khronos-RenderPassMultiviewCreateInfo => 1000053000,
    Khronos-PhysicalDeviceMultiviewFeatures => 1000053001,
    Khronos-PhysicalDeviceMultiviewProperties => 1000053002,
    Nvidia-ExternalMemoryImageCreateInfo => 1000056000,
    Nvidia-ExportMemoryAllocateInfo => 1000056001,
    Nvidia-ImportMemoryWin32HandleInfo => 1000057000,
    Nvidia-ExportMemoryWin32HandleInfo => 1000057001,
    Nvidia-Win32KeyedMutexAcquireReleaseInfo => 1000058000,
    Khronos-PhysicalDeviceFeatures2 => 1000059000,
    Khronos-PhysicalDeviceProperties2 => 1000059001,
    Khronos-FormatProperties2 => 1000059002,
    Khronos-ImageFormatProperties2 => 1000059003,
    Khronos-PhysicalDeviceImageFormatInfo2 => 1000059004,
    Khronos-QueueFamilyProperties2 => 1000059005,
    Khronos-PhysicalDeviceMemoryProperties2 => 1000059006,
    Khronos-SparseImageFormatProperties2 => 1000059007,
    Khronos-PhysicalDeviceSparseImageFormatInfo2 => 1000059008,
    Khronos-MemoryAllocateFlagsInfo => 1000060000,
    Khronos-BindBufferMemoryInfo => 1000060001,
    Khronos-BindImageMemoryInfo => 1000060002,
    Khronos-DeviceGroupRenderPassBeginInfo => 1000060003,
    Khronos-DeviceGroupCommandBufferBeginInfo => 1000060004,
    Khronos-DeviceGroupSubmitInfo => 1000060005,
    Khronos-DeviceGroupBindSparseInfo => 1000060006,
    Khronos-DeviceGroupPresentCapabilities => 1000060007,
    Khronos-ImageSwapchainCreateInfo => 1000060008,
    Khronos-BindImageMemorySwapchainInfo => 1000060009,
    Khronos-AcquireNextImageInfo => 1000060010,
    Khronos-DeviceGroupPresentInfo => 1000060011,
    Khronos-DeviceGroupSwapchainCreateInfo => 1000060012,
    Ext-ValidationFlags => 1000061000,
    Nintendo-VISurfaceCreateInfo => 1000062000,
    Khronos-PhysicalDeviceGroupProperties => 1000070000,
    Khronos-DeviceGroupDeviceCreateInfo => 1000070001,
    Khronos-PhysicalDeviceExternalImageFormatInfo => 1000071000,
    Khronos-ExternalImageFormatProperties => 1000071001,
    Khronos-PhysicalDeviceExternalBufferInfo => 1000071002,
    Khronos-ExternalBufferProperties => 1000071003,
    Khronos-PhysicalDeviceIDProperties => 1000071004,
    Khronos-ExternalMemoryBufferCreateInfo => 1000072000,
    Khronos-ExternalMemoryImageCreateInfo => 1000072001,
    Khronos-ExportMemoryAllocateInfo => 1000072002,
    Khronos-ImportMemoryWin32HandleInfo => 1000073000,
    Khronos-ExportMemoryWin32HandleInfo => 1000073001,
    Khronos-MemoryWin32HandleProperties => 1000073002,
    Khronos-MemoryGetWin32HandleInfo => 1000073003,
    Khronos-ImportmemoryFDInfo => 1000074000,
    Khronos-MemoryFDProperties => 1000074001,
    Khronos-MemoryGetFDInfo => 1000074002,
    Khronos-Win32KeyedMutexAcquireReleaseInfo => 1000075000,
    Khronos-PhysicalDeviceExternalSemaphoreInfo => 1000076000,
    Khronos-ExternalSemaphoreProperties => 1000076001,
    Khronos-ExportSemaphoreCreateInfo => 1000077000,
    Khronos-ImportSemaphoreWin32HandleInfo => 1000078000,
    Khronos-ExportSemaphoreWin32HandleInfo => 1000078001,
    Khronos-D3D12FenceSubmitInfo => 1000078002,
    Khronos-SemaphoreGetWin32HandleInfo => 1000078003,
    Khronos-ImportSemaphoreFDInfo => 1000079000,
    Khronos-SemaphoreGetFDInfo => 1000079001,
    Khronos-PhysicalDevicePushDescriptorProperties => 1000080000,
    Khronos-PhysicalDevice16BitStorageFeatures => 1000083000,
    Khronos-PresentRegions => 1000084000,
    Khronos-DescriptorUpdateTemplateCreateInfo => 1000085000,
    Nvidia-ObjectTableCreateInfo => 1000086000,
    Nvidia-IndirectCommandsLayoutCreateInfo => 1000086001,
    Nvidia-CmdProcessCommandsInfo => 1000086002,
    Nvidia-CmdReserveSpaceForCommandsInfo => 1000086003,
    Nvidia-DeviceGeneratedCommandsLimits => 1000086004,
    Nvidia-DeviceGeneratedCommandsFeatures => 1000086005,
    Nvidia-PipelineViewportWScalingStateCreateInfo => 1000087000,
    Ext-SurfaceCapabilities2 => 1000090000,
    Ext-DisplayPowerInfo => 1000091000,
    Ext-DeviceEventInfo => 1000091001,
    Ext-DisplayEventInfo => 1000091002,
    Ext-SwapchainCounterCreateInfo => 1000091003,
    Google-PresentTimesInfo => 1000092000,
    Nvidia-PhysicalDeviceMultiviewPerViewAttributesProperties => 1000097000,
    Nvidia-PipelineViewportSwizzleStateCreateInfo => 1000098000,
    Ext-PhysicalDeviceDiscardRectangleProperties => 1000099000,
    Ext-PipelineDiscardRectangleStateCreateInfo => 1000099001,
    Ext-HDRMetadata => 1000105000,
    Khronos-SharedPresentSurfaceCapabilities => 1000111000,
    Khronos-PhysicalDeviceExternalFenceInfo => 1000112000,
    Khronos-ExternalFenceProperties => 1000112001,
    Khronos-ExportFenceCreateInfo => 1000113000,
    Khronos-ImportFenceWin32HandleInfo => 1000114000,
    Khronos-ExportFenceWin32HandleInfo => 1000114001,
    Khronos-FenceGetWin32HandleInfo => 1000114002,
    Khronos-ImportFenceFDInfo => 1000115000,
    Khronos-FenceGetFDInfo => 1000115001,
    Khronos-PhysicalDeviceSurfaceInfo2 => 1000119000,
    Khronos-SurfaceCapabilites2 => 1000119001,
    Khronos-SurfaceFormat2 => 1000119002,
    Khronos-PhysicalDeviceVariablePointerFeatures => 1000120000,
    MoltenVK-IOSSurfaceCreateInfo => 1000122000,
    MoltenVK-MacOSSurfaceCreateInfo => 1000123000,
    Khronos-MemoryDedicatedRequirements => 1000127000,
    Khronos-MemoryDedicatedAllocateInfo => 1000127001,
    Ext-PhysicalDeviceSamplerFilterMinMaxProperties => 1000130000,
    Ext-SamplerReductionModeCreateInfo => 1000130001,
    Khronos-BuffermemoryRequirementsInfo2 => 1000146000,
    Khronos-ImageMemoryRequirementsInfo2 => 1000146001,
    Khronos-ImageSparseMemoryRequirementsInfo2 => 1000146002,
    Khronos-MemoryRequirements2 => 1000146003,
    Khronos-SparseImageMemoryRequirements2 => 1000146004,
    Ext-PhysicalDeviceBlendOperationAdvancedFeatures => 1000148000,
    Ext-PhysicalDeviceBlendOperationAdvancedProperties => 1000148001,
    Ext-PipelineColorBlendAdvancedStateCreateInfo => 1000148002,
    Nvidia-PipelineCoverageTocolorStateCreateInfo => 1000149000,
    Nvidia-PipelineCoverageModulationStateCreateInfo => 1000152000
);

our enum Result (
    Success => 0,
    NotReady => 1,
    Timeout => 2,
    EventSet => 3,
    EventReset => 4,
    Incomplete => 5,
    SuboptimalKHR => 1000001003
);

our enum Error (
    OutOfHostMemory => -1,
    OutOfDeviceMemory => -2,
    InitializationFailed => -3,
    DeviceLost => -4,
    MemoryMapFailed => -5,
    LayerNotPresent => -6,
    ExtensionNotPresent => -7,
    FeatureNotPresent => -8,
    IncompatibleDriver => -9,
    TooManyObjects => -10,
    FormatNotSupported => -11,
    FragmentedPool => -12,
    SurfaceLostKHR => -1000000000,
    NativeWindowInUseKHR => -1000000001,
    OutOfDateKHR => -100001004,
    IncompatibleDisplayKHR => -100003001,
    ValidationFailedExt => -1000011001,
    InvalidShaderNV => -1000012000,
    OutOfPoolMemoryKHR => -1000069000,
    InvalidExternalHandleKHR => -1000072003,
);

our enum SharingMode (
    Exclusive => 0,
    Concurrent => 1
);

our class ApplicationInfo is repr('CStruct') {
    has StructureType $.type = StructureType::ApplicationInfo;
    has Pointer[void] $.next;
    has Str $.application-name;
    has uint32 $.application-version;
    has Str $.engine-name;
    has uint32 $.engine-version;
    has uint32 $.api-version;
}

our class ExtensionProperties is repr('CStruct') {
    has Str $.extension-name;
    has uint32 $.spec-version;
}

our class LayerProperties is repr('CStruct') {
    has Str $.layer-name;
    has uint32 $.spec-version;
    has uint32 $.implementation-version;
    has Str $.description;
}

our class SubmitInfo is repr('CStruct') {
    has StructureType $.type;
    has Pointer $.next;
    has uint32 $.wait-semaphore-count;
    has Vulkan::Semaphore $.wait-semaphores;
    has uint32 $.wait-dest-stage-mask;
    has uint32 $.command-buffer-count;
    has CArray[Vulkan::Buffer::Command] $.command-buffers;
    has uint32 $.signal-semaphore-count;
    has CArray[Vulkan::Semaphore] $.signal-semaphores;
}
