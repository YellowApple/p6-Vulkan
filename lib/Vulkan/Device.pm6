unit class Vulkan::Device is repr('CPointer');

use NativeCall;

our class CreateInfo is repr('CStruct') {
    has Vulkan::StructureType $.type;
    has Pointer $.next;
    has uint32 $.flags;
    has uint32 $.queue-create-info-count;
    has CArray[Vulkan::Queue::CreateInfo] $.queue-create-infos;
    has uint32 $.enabled-layer-count;
    has CArray[Str] $.enabled-layer-names;
    has uint32 $.enabled-extension-count;
    has CArray[Str] $.enabled-extension-names;
    # FIXME: is this really right?
    has CArray[Vulkan::Device::Physical::Features] $.enabled-features;
}
