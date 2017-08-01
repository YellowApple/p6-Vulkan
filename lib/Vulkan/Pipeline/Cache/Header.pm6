unit module Vulkan::Pipeline::Cache::Header;

our enum Version (
  One => 1,
  # FIXME: The hell is going on in VkPipelineCacheHeaderVersion?
  RangeBegin => 1,  # RangeBegin = One ???
  RangeEnd => 1,    # RangeEnd = One ???
  RangeSize => 1,   # RangeSize = One - One + 1 ???
  MaxEnum => 0x7FFFFFFF
);
