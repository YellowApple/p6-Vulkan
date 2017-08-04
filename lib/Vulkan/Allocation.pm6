unit module Vulkan::Allocation;

use NativeCall;

our class Callbacks is repr('CStruct') {
    has Pointer[void] $.user-data;
    has &.allocation (Pointer[void],
                      size_t,
                      size_t,
                      Vulkan::Allocation::System::Scope);
    has &.reallocation (Pointer[void],
                        Pointer[void],
                        size_t,
                        size_t,
                        Vulkan::Allocation::System::Scope);
    has &.free (Pointer[void], Pointer[void]);
    has &.internal-allocation(Pointer[void],
                              size_t,
                              Vulkan::Allocation::Internal::Type,
                              Vulkan::Allocation::System::Scope);
    has &.internal-free(Pointer[void],
                        size_t,
                        Vulkan::Allocation::Internal::Type,
                        Vulkan::Allocation::System::Scope);
}
