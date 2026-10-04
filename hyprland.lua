------------------
---- MONITORS ----
------------------

-- Fallback for any monitor without its own rule
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

-- Per-monitor rules: loads ~/.config/hypr/monitors.lua
require("monitors")

-- For high-DPI displays (e.g., 3K), uncomment and adjust:
-- hl.monitor({ output = "", mode = "highres", position = "auto", scale = 1.5 })
-- The '1.5' is the scale factor - try 1.5, 2, or 2.5 based on your preference


---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "ghostty"
local fileManager = "thunar"
local menu        = "fuzzel"
local browser     = "helium-browser"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    -- hl.exec_cmd(terminal)
    hl.exec_cmd("waybar & swaync & hyprpolkitagent")
    hl.exec_cmd("snappy-switcher --daemon")
    hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface GTK-theme "Nordic"')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface icon-theme "papirus-dark"')
    hl.exec_cmd("awww-daemon && sleep 1")
    hl.exec_cmd("awww img ~/.config/hypr/wallpaper.png")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("sunshine")
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Nordic")
hl.env("AQ_NO_MODIFIERS", "1")


-----------------------
----- PERMISSIONS -----
-----------------------

-- hl.config({
--     ecosystem = {
--         enforce_permissions = true,
--     },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 4,

        border_size = 1,

        col = {
            active_border   = { colors = { "rgba(8fbcbbee)", "rgba(5e81acee)" }, angle = 45 },
            inactive_border = "rgba(4c566aee)",
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 8,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 0.9,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a, -- rgba(1a1a1aee), written as 0xAARRGGBB
        },

        blur = {
            enabled  = true,
            size     = 3,
            passes   = 1,

            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Curves
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}    } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1} } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}  } })

-- Animations
hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true, speed = 7,    bezier = "quick" })

-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
-- hl.window_rule({
--     name  = "no-gaps-f1",
--     match = { float = false, workspace = "f[1]" },
--     border_size = 0,
--     rounding    = 0,
-- })

hl.config({
    dwindle = {
        -- pseudotile = true, -- Master switch for pseudotiling. Enabling is bound to mainMod + P below
        preserve_split = true, -- You probably want this
    },

    master = {
        new_status = "master",
    },

    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "fr",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        numlock_by_default = true,

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers   = 3,
    direction = "horizontal",
    action    = "workspace",
})

hl.device({
    name          = "compx-wireless-mouse-8k-nano-dongle-l",
    sensitivity   = -0.3,
    accel_profile = "flat",
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind("ALT + Return",         hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + W",      hl.dsp.window.close())
hl.bind(mainMod .. " + M",      hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + T",      hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + Space",  hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P",      hl.dsp.window.pseudo()) -- dwindle
-- hl.bind(mainMod .. " + J",   hl.dsp.layout("togglesplit")) -- dwindle
hl.bind(mainMod .. " + F",      hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + B",      hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + L",      hl.dsp.exec_cmd("hyprlock"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move window positions (Swap)
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- Resize windows
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.resize({ x = 30,  y = 0,   relative = true }))
hl.bind(mainMod .. " + ALT + left",  hl.dsp.window.resize({ x = -30, y = 0,   relative = true }))
hl.bind(mainMod .. " + ALT + up",    hl.dsp.window.resize({ x = 0,   y = -30, relative = true }))
hl.bind(mainMod .. " + ALT + down",  hl.dsp.window.resize({ x = 0,   y = 30,  relative = true }))

-- Screenshot a region
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region"))
-- Screenshot a monitor (full screen)
hl.bind(mainMod .. " + SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m output"))
-- Screenshot a window
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Snappy-switcher
hl.bind("ALT + Tab",         hl.dsp.exec_cmd("snappy-switcher next"))
hl.bind("ALT + SHIFT + Tab", hl.dsp.exec_cmd("snappy-switcher prev"))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Lock screen when laptop lid is closed
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock"), { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

-- Media Apps floating
hl.window_rule({
    name  = "media-defaults",
    match = { class = [[^(imv|mpv|org\.pulseaudio\.pavucontrol)$]] },

    float  = true,
    center = true,
    size   = { "monitor_w*0.7", "monitor_h*0.7" },
})

hl.window_rule({
    name  = "waybar-popups",
    -- Add more apps here if needed
    match = { initial_class = [[^(com\.app\.(btop|gazelle|bluetuith))$]] },

    float  = true,
    size   = { "monitor_w*0.5", "monitor_h*0.75" },
    center = true,
})
