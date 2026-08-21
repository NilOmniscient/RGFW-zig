const std = @import("std");
const rgfw = @import("rgfw.zig");

pub fn main() !void {
    // Just attempt to Initialize RGFW
    try rgfw.init("Hello", .{ .OpenGL = true, .Vulkan = true });
}
