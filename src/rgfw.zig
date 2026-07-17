const std = @import("std");

// Public functions
pub fn init(className: [*:0]const u8, flags: u8) void {
    const ret = RGFW_init(className, flags);
    std.debug.print("Result: {d}\n", .{ret});
}

// Window functions
pub fn createWindow(name: [*:0]const u8, x: i32, y: i32, w: i32, h: i32, flags: u8) *Window {
    return RGFW_createWindow(name, x, y, w, h, flags);
}

// Enums
const InitFlags = enum(u8) {
    OpenGL = RGFW_BIT(0),
    EGL = RGFW_BIT(1),
    Vulkan = RGFW_BIT(2),
    X11 = RGFW_BIT(3),
};
const Format = enum(u8) {
    RGB8 = 0,
    BGR8,
    RGBA8,
    ARGB8,
    BGRA8,
    ABGR8,
};
const ModeRequest = enum(u8) {
    MonitorScale = RGFW_BIT(0),
    MonitorRefresh = RGFW_BIT(1),
    MonitorRGB = RGFW_BIT(2),
    MonitorAll = RGFW_BIT(0) | RGFW_BIT(1) | RGFW_BIT(2),
};
const Key = enum(u8) {
    Null = 0,
    Escape = '\x1B',
    Backtick = '`',
    key0 = '0',
    key1 = '1',
    key2 = '2',
    key3 = '3',
    key4 = '4',
    key5 = '5',
    key6 = '6',
    key7 = '7',
    key8 = '8',
    key9 = '9',
    Minus = '-',
    Equal = '=',
    Equals = '=',
    Backspace = '\x08',
    Tab = '\x09',
    Space = ' ',
    A = 'a',
    B = 'b',
    C = 'c',
    D = 'd',
    E = 'e',
    F = 'f',
    G = 'g',
    H = 'h',
    I = 'i',
    J = 'j',
    K = 'k',
    L = 'l',
    M = 'm',
    N = 'n',
    O = 'o',
    P = 'p',
    Q = 'q',
    R = 'r',
    S = 's',
    T = 't',
    U = 'u',
    V = 'v',
    W = 'w',
    X = 'x',
    Y = 'y',
    Z = 'z',
    Period = '.',
    Comma = ',',
    Slash = '/',
    Bracket = '[',
    CloseBracket = ']',
    Semicolon = ';',
    Apostrophe = '\x27',
    Backslash = '\x5C',
    Return = '\x0A',
    Enter = '\x0A',
    Delete = '\x7F',
    F1,
    F2,
    F3,
    F4,
    F5,
    F6,
    F7,
    F8,
    F9,
    F10,
    F11,
    F12,
    F13,
    F14,
    F15,
    F16,
    F17,
    F18,
    F19,
    F20,
    F21,
    F22,
    F23,
    F24,
    F25,
    CapsLock,
    ShiftL,
    ControlL,
    AltL,
    SuperL,
    ShiftR,
    ControlR,
    AltR,
    SuperR,
    Up,
    Down,
    Left,
    Right,
    Insert,
    Menu,
    End,
    Home,
    PageUp,
    PageDown,
    NumLock,
    PadSlash,
    PadMultiply,
    PadPlus,
    PadMinus,
    PadEqual,
    Pad1,
    Pad2,
    Pad3,
    Pad4,
    Pad5,
    Pad6,
    Pad7,
    Pad8,
    Pad9,
    Pad0,
    PadPeriod,
    PadReturn,
    ScrollLock,
    PrintScreen,
    Pause,
    World1,
    World2,
};
const MouseButton = enum(u8) {
    Left = 0,
    Middle,
    Right,
    Misc1,
    Misc2,
    Misc3,
    Misc4,
    Misc5,
};
const Keymod = enum(u8) {
    CapsLock,
    NumLock,
    Control,
    Alt,
    Shift,
    Super,
    ScrollLock,
};
const DNDActionType = enum(u8) {
    None = 0,
    Enter,
    Move,
    Exit,
};
const DataTransferType = enum(u8) {
    Next = 0,
    Text,
    File,
    URL,
    Image,
    Unknown,
};
const EventType = enum(u8) {
    None = 0,
    KeyPressed,
    KeyReleased,
    KeyChar,
    MouseButtonPressed,
    MouseButtonReleased,
    MouseScroll,
    MouseMotion,
    MouseRawMotion,
    MouseEnter,
    MouseLeave,
    WindowMoved,
    WindowResized,
    WindowFocusIn,
    WindowFocusOut,
    WindowRefresh,
    WindowClose,
    WindowMaximized,
    WindowMinimized,
    WindowRestored,
    DataDrop,
    DataDrag,
    ScaleUpdated,
    MonitorConnected,
    MonitorDisconnected,
};

// Structs
const ColorLayout = extern struct {
    r: i32,
    g: i32,
    b: i32,
    a: i32,
    channels: u32,
};
const GammaRamp = extern struct {
    red: [*]u16,
    green: [*]u16,
    blue: [*]u16,
    count: usize,
};
const MonitorMode = extern struct {
    w: i32,
    h: i32,
    refreshRate: f32,
    red: u8,
    blue: u8,
    green: u8,
    src: *anyopaque,
};
const Monitor = extern struct {
    x: i32,
    y: i32,
    name: [128]u8,
    scaleX: f32,
    scaleY: f32,
    pixelRatio: f32,
    physW: f32,
    physH: f32,
    mode: MonitorMode,
    userPtr: *anyopaque,
    node: *MonitorNode,
};
const DataTransfer = extern struct {
    data: [*]u8,
    length: usize,
    type: DataTransferType,
};
const DataDropNode = extern struct {
    data: [*]u8,
    length: usize,
    type: DataTransferType,
    next: *DataDropNode,
};
const CommonEvent = extern struct {
    type: EventType,
    win: *Window,
};
const WindowFocusEvent = extern struct {
    type: EventType,
    win: *Window,
    state: bool,
};
const MouseButtonEvent = extern struct {
    type: EventType,
    win: *Window,
    value: MouseButton,
    state: bool,
};
const MouseDeltaEvent = extern struct {
    type: EventType,
    win: *Window,
    x: f32,
    y: f32,
};

// TODO: Pick up here

// Opaques
const Info = opaque {};
const Window = opaque {};
const WindowSrc = opaque {};
const NativeImage = opaque {};
const Surface = opaque {};
const MonitorNode = opaque {};

// Start External functions. -- ROOT Functions
extern fn RGFW_init(className: [*:0]const u8, flags: u8) i32;
extern fn RGFW_convertImageDataFunc(dest_data: *u8, src_data: *u8, srcLayout: *const ColorLayout, destLayout: *const ColorLayout, count: usize) *anyopaque;

// Window functions
extern fn RGFW_createWindow(name: [*:0]const u8, x: i32, y: i32, w: i32, h: i32, flags: u8) *Window;

// Comptime Helpers
fn RGFW_BIT(n: u8) u8 {
    return 1 << n;
}
