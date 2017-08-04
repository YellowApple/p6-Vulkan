unit class Vulkan::Instance is repr('CPointer');

use NativeCall;
use Vulkan;

our class CreateInfo is repr('CStruct') {
    has StructureType $.type = StructureType::InstanceCreateInfo;
    has Pointer[void] $.next;
    has uint32 $.flags;
    has ApplicationInfo $.application-info;
    has uint32 $.enabled-layer-count;
    has CArray[Str] $.enabled-layer-names;
    has uint32 $.enabled-extension-count;
    has CArray[Str] $.enabled-extension-names;
}
