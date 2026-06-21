------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})
hl.monitor({ output = "eDP-1", disabled = true })

---------------------
---- MY PROGRAMS ----
---------------------

local menu = "vicinae toggle"
local terminal = "ghostty"
local fileManagerGui = "nautilus"
local fileManagerTui = terminal .. " -e yazi"
local screenshot = "hyprshot -o ~/Pictures/Screenshots -f screenshot-$(date +'%F-%H%M%S').png"
local clipboard = "vicinae vicinae://launch/clipboard/history"
local ipc = "qs -c noctalia-shell ipc call "

-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("hyprsunset")
	hl.exec_cmd("vicinae server")
	hl.exec_cmd("qs -c noctalia-shell")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- See https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		layout = "master",
		gaps_in = 4,
		gaps_out = 8,
		float_gaps = 8,
		border_size = 2,
		resize_on_border = false,
		allow_tearing = false,
		snap = {
			enabled = true,
			respect_gaps = true,
		},
	},

	decoration = {
		rounding = 4,
		rounding_power = 2,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = false,
		},
		blur = {
			enabled = false,
		},
	},

	animations = {
		enabled = true,
	},

	group = {
		auto_group = true,
		insert_after_current = true,
		groupbar = {
			render_titles = false,
			rounding = 4,
			round_only_edges = false,
			gaps_in = 4,
			gaps_out = 4,
			indicator_gap = -4,
			indicator_height = 8,
		},
	},
})

-- Theme
local colors = {
	primary = "rgb(7e9cd8)",
	surface = "rgb(1f1f28)",
	secondary = "rgb(76946a)",
	error = "rgb(c34043)",
	tertiary = "rgb(c0a36e)",
	surface_lowest = "rgb(21212b)",
}
hl.config({
	general = {
		col = {
			active_border = colors.primary,
			inactive_border = colors.surface,
		},
	},
	group = {
		col = {
			border_active = colors.secondary,
			border_inactive = colors.surface,
			border_locked_active = colors.error,
			border_locked_inactive = colors.surface,
		},
		groupbar = {
			col = {
				active = colors.secondary,
				inactive = colors.surface,
				locked_active = colors.error,
				locked_inactive = colors.surface,
			},
		},
	},
})

-- Curves and Animations
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
-- stylua: ignore start
hl.curve("linear",    { type = "bezier", points = { { 0.00, 0 }, { 1.00, 1 } } })
hl.curve("easeOut",   { type = "bezier", points = { { 0.50, 0 }, { 0.75, 0 } } })
hl.curve("easeIn",    { type = "bezier", points = { { 0.25, 1 }, { 0.50, 1 } } })
hl.curve("easeInOut", { type = "bezier", points = { { 0.76, 0 }, { 0.24, 1 } } })
hl.curve("quick",     { type = "bezier", points = { { 0.15, 0 }, { 0.10, 1 } } })
hl.animation({ leaf = "global",               enabled = true, speed = 3, bezier = "linear" })
hl.animation({ leaf = "windows",              enabled = true, speed = 3, bezier = "linear", style = "slide" })
hl.animation({ leaf = "windowsIn",            enabled = true, speed = 3, bezier = "linear", style = "slide" })
hl.animation({ leaf = "windowsOut",           enabled = true, speed = 3, bezier = "linear", style = "slide" })
hl.animation({ leaf = "workspaces",           enabled = true, speed = 3, bezier = "easeInOut", style = "slide" })
hl.animation({ leaf = "specialWorkspaceIn",   enabled = true, speed = 3, bezier = "linear", style = "slide top" })
hl.animation({ leaf = "specialWorkspaceOut",  enabled = true, speed = 3, bezier = "linear", style = "slide bottom" })
hl.animation({ leaf = "zoomFactor",           enabled = true, speed = 7, bezier = "quick" })
-- stylua: ignore end

---------------
--- Layouts ---
---------------

hl.config({
	-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/
	master = {
		mfact = 0.5,
		new_status = "slave",
		orientation = "left",
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		mouse_move_enables_dpms = false,
		key_press_enables_dpms = true,
		force_default_wallpaper = 0,
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "altgr-intl",
		kb_options = "caps:escape",
		kb_model = "",
		kb_rules = "",

		sensitivity = 0,
		follow_mouse = 1,
	},
})

hl.gesture({ fingers = 3, mods = "SUPER", direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 2, mods = "SUPER", direction = "pinch", action = "cursorZoom", mode = "live" })

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- See https://wiki.hypr.land/Configuring/Basics/Binds/

-- System / Shell
-- hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + ALT + Q", hl.dsp.exec_cmd(ipc .. "sessionMenu toggle"))
hl.bind(mainMod .. " + ALT + V", hl.dsp.exec_cmd(ipc .. "volume togglePanel"))
hl.bind(mainMod .. " + ALT + B", hl.dsp.exec_cmd(ipc .. "bar toggle"))
hl.bind(mainMod .. " + ALT + N", hl.dsp.exec_cmd(ipc .. "notifications toggleHistory"))
hl.bind(mainMod .. " + ALT + M", hl.dsp.exec_cmd(ipc .. "media toggle"))

-- Programs
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManagerGui))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManagerTui))
-- Utilities
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(clipboard))
hl.bind("Print", hl.dsp.exec_cmd(screenshot .. " -m region"))
hl.bind("CTRL + Print", hl.dsp.exec_cmd(screenshot .. " -m window"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd(screenshot .. " -m output -m active"))

-- Windows
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- State
hl.bind(mainMod .. " + U", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + I", hl.dsp.window.fullscreen({ action = "toggle", mode = "maximized" }))
hl.bind(mainMod .. " + O", hl.dsp.window.float({ action = "toggle" }))
-- Focus next/prev
hl.bind(mainMod .. " + J", hl.dsp.layout("cyclenext"))
hl.bind(mainMod .. " + K", hl.dsp.layout("cycleprev"))
-- Swap next/prev/master
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("swapnext"))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.layout("swapprev"))
hl.bind(mainMod .. " + M", hl.dsp.layout("swapwithmaster"))
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspaces
for i = 1, 9 do
	hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
-- Scroll through existing workspaces
hl.bind(mainMod .. " + H", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ workspace = "e+1" }))
-- Move window to next/prev existing workspace
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ workspace = "e-1" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ workspace = "e+1" }))
-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
-- Special workspaces
hl.bind(mainMod .. " + Z", hl.dsp.workspace.toggle_special("1"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.window.move({ workspace = "special:1" }))
hl.bind(mainMod .. " + X", hl.dsp.workspace.toggle_special("2"))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.window.move({ workspace = "special:2" }))

-- Groups
hl.bind(mainMod .. " + Semicolon", hl.dsp.group.toggle())
hl.bind(mainMod .. " + TAB", hl.dsp.group.next())
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.group.prev())
hl.bind(mainMod .. " + CTRL + Semicolon", hl.dsp.window.move({ out_of_group = true }))
hl.bind(mainMod .. " + CTRL + J", hl.dsp.window.move({ into_group = "d" }))
hl.bind(mainMod .. " + CTRL + K", hl.dsp.window.move({ into_group = "u" }))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.window.move({ into_group = "l" }))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.window.move({ into_group = "r" }))

-- Laptop multimedia and brightness keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume increase"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume decrease"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume muteOutput"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(ipc .. "volume muteInput"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness increase"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness decrease"), { locked = true, repeating = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "center-all-floating-windows",
	match = {
		-- At least contain 1 character to exclude electron apps context/dropdown/tooltips menus
		class = ".+",
		title = ".+",
		float = true,
	},
	center = true,
})

hl.window_rule({
	name = "PiP-move-float-and-pin",
	match = { title = "Picture-in-Picture" },
	pin = true,
	float = true,
	size = { "monitor_w * 0.25", "monitor_h * 0.25" },
	move = { "(monitor_w/2)-(window_w/2)+16", 8 },
	border_size = 0,
})

hl.window_rule({
	name = "hyprland-share-picker-floating",
	match = { class = "hyprland-share-picker" },
	float = true,
	size = { 400, 600 },
})

hl.window_rule({ workspace = "special:1", match = { class = ".*youtube_music" } })
hl.window_rule({ workspace = "special:2", match = { class = "com.obsproject.Studio" } })
hl.window_rule({ workspace = "3", match = { class = "steam" } })
hl.window_rule({ workspace = "4", match = { class = "vesktop" } })
