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
