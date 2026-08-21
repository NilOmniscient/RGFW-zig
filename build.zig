const std = @import("std");

const rgfw_macros = [_][]const u8{
    "-D RGFW_OPENGL", "-D RGFW_VULKAN", "-D RGFW_EGL",
    "-D RGFW_EXPORT",
};

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const rgfw_src = b.dependency("rgfw", .{});

    // First, build the C lib.
    const rgfw_cmod = b.createModule(.{
        .link_libc = true,
        .optimize = optimize,
        .target = target,
        .root_source_file = b.path("src/rgfw.zig"),
    });
    rgfw_cmod.addCSourceFile(.{
        .file = b.path("src/RGFW.c"),
        .flags = &rgfw_macros,
    });
    rgfw_cmod.addIncludePath(rgfw_src.path(""));

    if (target.result.os.tag == .windows) {
        rgfw_cmod.linkSystemLibrary("opengl32", .{});
        rgfw_cmod.linkSystemLibrary("gdi32", .{});
    } else if (target.result.os.tag == .macos) {
        rgfw_cmod.linkFramework("Cocoa", .{});
    } else {
        // Need to link required libs
        rgfw_cmod.linkSystemLibrary("X11", .{});
        rgfw_cmod.linkSystemLibrary("m", .{});
        rgfw_cmod.linkSystemLibrary("Xrandr", .{});
        rgfw_cmod.linkSystemLibrary("GL", .{});
    }
    const exe = b.addExecutable(.{
        .name = "RGFW_test",
        .root_module = b.createModule(.{
            .optimize = optimize,
            .target = target,
            .root_source_file = b.path("src/main.zig"),
            .imports = &.{
                .{ .name = "rgfw", .module = rgfw_cmod },
            },
        }),
        .use_llvm = true,
        .use_lld = true,
    });
    b.installArtifact(exe);
}
