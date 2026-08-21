pub const std = @import("std");

// Public functions
pub fn init(className: [*:0]const u8, flags: InitFlags) !void {
    const ret = RGFW_init(className, @bitCast(flags));
    if (ret != 0) return error.RGFW_InitFailed;
    return;
}

// Window functions
pub fn createWindow(name: [*:0]const u8, x: i32, y: i32, w: i32, h: i32, flags: u8) *Window {
    return RGFW_createWindow(name, x, y, w, h, flags);
}

// Bit Flags
pub const InitFlags = packed struct(u8) {
    opengl: bool = false,
    egl: bool = false,
    vulkan: bool = false,
    x11: bool = false,
    _padding: u4 = 0,
};
pub const WindowFlags = packed struct(i32) {
    no_border: bool = false,
    no_resize: bool = false,
    allow_dnd: bool = false,
    hide_mouse: bool = false,
    fullscreen: bool = false,
    translucent: bool = false,
    center: bool = false,
    raw_mouse: bool = false,
    scale_to_monitor: bool = false,
    hide: bool = false,
    maximize: bool = false,
    center_cursor: bool = false,
    floating: bool = false,
    focus_on_show: bool = false,
    minimize: bool = false,
    focus: bool = false,
    capture_mouse: bool = false,
    opengl: bool = false,
    egl: bool = false,
};

// Enums
pub const Format = enum(u8) {
    RGB8 = 0,
    BGR8,
    RGBA8,
    ARGB8,
    BGRA8,
    ABGR8,
};
pub const ModeRequest = enum(u8) {
    MonitorScale = RGFW_BIT(0),
    MonitorRefresh = RGFW_BIT(1),
    MonitorRGB = RGFW_BIT(2),
    MonitorAll = RGFW_BIT(0) | RGFW_BIT(1) | RGFW_BIT(2),
};
pub const Key = enum(u8) {
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
pub const MouseButton = enum(u8) {
    Left = 0,
    Middle,
    Right,
    Misc1,
    Misc2,
    Misc3,
    Misc4,
    Misc5,
};
pub const Keymod = enum(u8) {
    CapsLock,
    NumLock,
    Control,
    Alt,
    Shift,
    Super,
    ScrollLock,
};
pub const DNDActionType = enum(u8) {
    None = 0,
    Enter,
    Move,
    Exit,
};
pub const DataTransferType = enum(u8) {
    Next = 0,
    Text,
    File,
    URL,
    Image,
    Unknown,
};
pub const EventType = enum(u8) {
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
pub const EventWait = enum(i32) {
    NoWait = 0,
    WaitNext = -1,
};
pub const Icon = enum(u8) {
    Taskbar = RGFW_BIT(0),
    Window = RGFW_BIT(1),
    Both = RGFW_BIT(0) | RGFW_BIT(1),
};
pub const MouseIcon = enum(u8) {
    Normal = 0,
    Arrow,
    IBeam,
    Text = 2,
    Crosshair,
    PointingHand,
    ResizeEW,
    ResizeNS,
    ResizeNWSE,
    ResizeNESW,
    ResizeNW,
    ResizeN,
    ResizeNE,
    ResizeE,
    ResizeSE,
    ResizeS,
    ResizeSW,
    ResizeW,
    ResizeAll,
    NotAllowed,
    Wait,
    Progress,
};
pub const FlashRequest = enum(u8) {
    Cancel = 0,
    Briefly,
    UntilFocused,
};
pub const DebugType = enum(u8) {
    Error = 0,
    Warning,
    Info,
};
pub const ErrorCode = enum(u8) {
    NoError = 0,
    ErrOutOfMemory,
    ErrOpenGLContext,
    ErrEGLContext,
    ErrWayland,
    ErrX11,
    ErrDirectXContext,
    ErrIOKit,
    ErrClipboard,
    ErrFailedFuncLoad,
    ErrBuffer,
    ErrMetal,
    ErrPlatform,
    ErrEventQueue,
    ErrNoInit,
    InfoWindow,
    InfoBuffer,
    InfoGlobal,
    InfoOpenGL,
    WarningWayland,
    WarningOpenGL,
};
pub const GLReleaseBehavior = enum(i32) {
    Flush = 0,
    None,
};
pub const GLProfile = enum(i32) {
    Core = 0,
    ForwardCompatibility,
    Compatibility,
    ES,
    Web,
};
pub const GLRenderer = enum(i32) {
    Accelerated = 0,
    Software,
};

// Structs
pub const ColorLayout = extern struct {
    r: i32,
    g: i32,
    b: i32,
    a: i32,
    channels: u32,
};
pub const GammaRamp = extern struct {
    red: [*]u16,
    green: [*]u16,
    blue: [*]u16,
    count: usize,
};
pub const MonitorMode = extern struct {
    w: i32,
    h: i32,
    refreshRate: f32,
    red: u8,
    blue: u8,
    green: u8,
    src: *anyopaque,
};
pub const Monitor = extern struct {
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
pub const DataTransfer = extern struct {
    data: [*]u8,
    length: usize,
    type: DataTransferType,
};
pub const DataDropNode = extern struct {
    data: [*]u8,
    length: usize,
    type: DataTransferType,
    next: *DataDropNode,
};
pub const CommonEvent = extern struct {
    type: EventType,
    win: *Window,
};
pub const WindowFocusEvent = extern struct {
    type: EventType,
    win: *Window,
    state: bool,
};
pub const MouseButtonEvent = extern struct {
    type: EventType,
    win: *Window,
    value: MouseButton,
    state: bool,
};
pub const MouseDeltaEvent = extern struct {
    type: EventType,
    win: *Window,
    x: f32,
    y: f32,
};
pub const MouseMotionEvent = extern struct {
    type: EventType,
    win: *Window,
    x: i32,
    y: i32,
    inWindow: bool,
};
pub const KeyEvent = extern struct {
    type: EventType,
    win: *Window,
    value: Key,
    repeat: bool,
    mod: Keymod,
    state: bool,
};
pub const KeyCharEvent = extern struct {
    type: EventType,
    win: *Window,
    value: u32,
};
pub const DataDropEvent = extern struct {
    type: EventType,
    win: *Window,
    value: *DataDropNode,
};
pub const DataDragEvent = extern struct {
    type: EventType,
    win: *Window,
    x: i32,
    y: i32,
    action: DNDActionType,
    data_type: DataTransferType,
};
pub const ScaleUpdateEvent = extern struct {
    type: EventType,
    win: *Window,
    x: f32,
    y: f32,
};
pub const MonitorEvent = extern struct {
    type: EventType,
    win: *Window,
    monitor: *Monitor,
    state: bool,
};
pub const WindowUpdateEvent = extern struct {
    type: EventType,
    win: *Window,
    x: i32,
    y: i32,
    w: i32,
    h: i32,
};
pub const Event = extern union {
    common: CommonEvent,
    focus: WindowFocusEvent,
    update: WindowUpdateEvent,
    button: MouseButtonEvent,
    delta: MouseDeltaEvent,
    mouse: MouseMotionEvent,
    key: KeyEvent,
    key_char: KeyCharEvent,
    drop: DataDropEvent,
    drag: DataDragEvent,
    scale: ScaleUpdateEvent,
    monitor: MonitorEvent,
};
pub const DebugInfo = extern struct {
    type: DebugType,
    code: ErrorCode,
    msg: [*c]const u8,
};
pub const GLHints = extern struct {
    stencil: i32,
    samples: i32,
    stereo: i32,
    aux_buffers: i32,
    double_buffer: bool,
    red: i32,
    green: i32,
    blue: i32,
    alpha: i32,
    depth: i32,
    accum_red: i32,
    accum_green: i32,
    accum_blue: i32,
    accum_alpha: i32,
    srgb: bool,
    robustness: bool,
    debug: bool,
    no_error: bool,
    release_behavior: GLReleaseBehavior,
    profile: GLProfile,
    major: i32,
    minor: i32,
    share: *GLContext,
    share_egl: *EGLContext,
    renderer: GLRenderer,
};

// Opaques
pub const Info = opaque {};
pub const Window = opaque {};
pub const WindowSrc = opaque {};
pub const NativeImage = opaque {};
pub const Surface = opaque {};
pub const MonitorNode = opaque {};
pub const GLContext = opaque {};
pub const EGLContext = opaque {};

// Callback functions
pub const GenericFunc = *const fn (e: *Event) void; // Event Callback
pub const Callbacks = extern struct {
    arr: [EventType]GenericFunc,
};
pub const DebugFunc = *const fn (info: *DebugInfo) void; // DebugCallback
pub const ConvertImageDataFunc = *const fn (dest_data: [*c]u8, src_data: [*c]u8, src_layout: *ColorLayout, dest_layout: *ColorLayout, count: usize) void;

// Start External functions. -- Data Functions
extern fn RGFW_alloc(size: usize) *anyopaque;
extern fn RGFW_free(ptr: *anyopaque) void;
extern fn RGFW_sizeofWindow() usize;
extern fn RGFW_sizeofWindowSrc() usize;
extern fn RGFW_usingWayland() bool;
extern fn RGFW_getLayerOSX() *anyopaque;
extern fn RGFW_getDisplay_X11() *anyopaque;
extern fn RGFW_getDisplay_Wayland() *anyopaque;
extern fn RGFW_moveToMacOSResourceDir() void;

// Image Functions
extern fn RGFW_copyImageData(dest_data: [*c]u8, w: i32, h: i32, dest_format: Format, src_data: [*c]u8, src_format: Format, func: ConvertImageDataFunc) void;
extern fn RGFW_sizeofNativeImage() usize;
extern fn RGFW_convertImageDataFunc(dest_data: *u8, src_data: *u8, srcLayout: *const ColorLayout, destLayout: *const ColorLayout, count: usize) *anyopaque;

// Surface Functions
extern fn RGFW_sizeofSurface() usize;
extern fn RGFW_nativeFormat() Format;
extern fn RGFW_createSurface(data: [*c]u8, w: i32, h: i32, format: Format) *Surface;
extern fn RGFW_createSurfacePtr(data: [*c]u8, w: i32, h: i32, format: Format, surface: *Surface) bool;
extern fn RGFW_surface_getNativeImage(surface: *Surface) *NativeImage;
extern fn RGFW_surface_free(surface: *Surface) void;
extern fn RGFW_surface_freePtr(surface: *Surface) void;

// Mouse Functions
extern fn RGFW_createMouse(data: [*c]u8, w: i32, h: i32, format: Format) *anyopaque;
extern fn RGFW_createMouseStandard(mouse: MouseIcon) *anyopaque;
extern fn RGFW_freeMouse(mouse: *anyopaque) void;

// Monitor Functions

// Core Functions
extern fn RGFW_init(className: [*:0]const u8, flags: u8) i32;

// Window functions
extern fn RGFW_createWindow(name: [*:0]const u8, x: i32, y: i32, w: i32, h: i32, flags: u8) *Window;

// Comptime Helpers
fn RGFW_BIT(n: u8) u8 {
    return 1 << n;
}
