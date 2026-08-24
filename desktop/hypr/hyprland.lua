-- Ported from hyprland.conf.

------------------
---- MONITORS ----
------------------

hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})


---------------------
---- MY PROGRAMS ----
---------------------

local terminal = "ghostty"
local fileManager = "thunar"
local menu = "rofi -show drun"
local browser = "google-chrome-stable"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
    hl.exec_cmd("fcitx5")
    hl.exec_cmd("waybar")
    hl.exec_cmd("swaybg -i /home/doug/Pictures/sdxl/good/ornate_castle.png")
    hl.exec_cmd("systemctl --user start hyprland-session.target")
end)

hl.on("hyprland.shutdown", function()
    os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("VK_DRIVER_FILES", "/usr/share/vulkan/icd.d/nvidia_icd.json")
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("NVD_BACKEND", "direct")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")


-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 1,

        col = {
            active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding = 4,
        active_opacity = 1.0,
        inactive_opacity = 1.0,

        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
    },

    master = {},

    misc = {
        force_default_wallpaper = 2,
        disable_hyprland_logo = false,
    },

    group = {
        drag_into_group = 2,
        merge_groups_on_drag = false,

        groupbar = {
            height = 28,
            font_size = 18,
            gradients = true,

            gradient_rounding = 5,
            gradient_round_only_edges = true,

            indicator_height = 3,
            indicator_gap = 0,
            rounding = 5,
            round_only_edges = false,
            round_only_outer = true,

            text_padding = 10,
            unfocused_opacity = 0.8,
            font_weight_active = "normal",
            font_weight_inactive = "normal",
            text_color_inactive = "rgba(ffffffaa)",

            blur = true,
            gaps_in = 4,
            gaps_out = 4,
            keep_upper_gap = false,

            col = {
                active = "rgba(1e88e5cc)",
                inactive = "rgba(888888aa)",
                locked_active = "rgba(ff0d57cc)",
                locked_inactive = "rgba(888888aa)",
                indicator_active = "rgba(ffffffdd)",
                indicator_inactive = "rgba(aaaaaaaa)",
                indicator_locked_active = "rgba(ffffffdd)",
                indicator_locked_inactive = "rgba(aaaaaaaa)",
            },
        },
    },
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 7, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 6, bezier = "default" })


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout = "",
        kb_variant = "",
        kb_model = "",
        kb_options = "compose:caps",
        kb_rules = "",

        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = false,
        },
    },

    cursor = {
        no_hardware_cursors = false,
    },
})

hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})

hl.layer_rule({
    name = "no_anim_for_selection",
    match = { namespace = "selection" },
    no_anim = true,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- Program exeecution
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + backslash", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager))

-- Window manipulation
hl.bind(mainMod .. " + K", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())
hl.bind(mainMod .. " + V", hl.dsp.window.float())
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + M", hl.dsp.window.fullscreen())

-- Group controls
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.group.lock())
hl.bind(mainMod .. " + Page_Up", hl.dsp.group.prev())
hl.bind(mainMod .. " + Page_Down", hl.dsp.group.next())

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move windows around
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.swap({ direction = "down" }))
hl.bind(mainMod .. " + tab", hl.dsp.layout("togglesplit"))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Move workspaces across monitors
for i = 1, 2 do
  hl.bind("CTRL + " .. mainMod .. " + SHIFT + " .. i, hl.dsp.workspace.move({ monitor = i }))
end

-- Special workspace
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume controls
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("slurp | grim -g -"))

-- Zooming
local MAX_ZOOM = 3
local MIN_ZOOM = 1

---@param offset number
---@return nil
local function zoom(offset)
    local curr_zoom = hl.get_config("cursor.zoom_factor")
    local next_zoom = math.max(MIN_ZOOM, math.min(MAX_ZOOM, curr_zoom + offset))
    hl.config({ cursor = { zoom_factor = next_zoom } })
end

hl.bind(mainMod .. " + SHIFT + mouse_down", function()
    zoom(0.5)
end)
hl.bind(mainMod .. " + SHIFT + mouse_up", function()
    zoom(-0.5)
end)

