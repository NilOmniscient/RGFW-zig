const std = @import("std");
const rgfw = @import("rgfw.zig");

pub fn main() void {
    // Just attempt to Initialize RGFW
    rgfw.init("Hello", 0);
}
