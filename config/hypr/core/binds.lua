local programs = require("core.programs")

local main = "ALT"
local second = main .. " + SHIFT"

--Programs
hl.bind(main .. " + T", hl.dsp.exec_cmd(programs.terminal))
hl.bind(main .. " + D", hl.dsp.exec_cmd(programs.fileManager))
hl.bind(main .. " + SPACE", hl.dsp.exec_cmd(programs.launcher))
hl.bind(main .. " + W", hl.dsp.exec_cmd(programs.browser))
hl.bind("SUPER + L", hl.dsp.exec_cmd(programs.lockScreen))
hl.bind(second .. " + W", hl.dsp.exec_cmd(programs.wallpaper))

--Close tile
hl.bind(main .. " + Q", hl.dsp.window.close())

-- Floating tile
hl.bind(main .. " + V", hl.dsp.window.float({ action = "toggle" }))

--Reduce window size inside the tile
hl.bind(main .. " + P", hl.dsp.window.pseudo())

-- Vertical/horizontal split
hl.bind(main .. " + J", hl.dsp.layout("togglesplit"))

-- Move focus
hl.bind(main .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(main .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(main .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(main .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move tiles
hl.bind(second .. " + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(second .. " + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(second .. " + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(second .. " + down",  hl.dsp.window.move({ direction = "down" }))

-- Fullscreen
hl.bind(main .. " + F",  hl.dsp.window.fullscreen({ mode = "maximized" }))

-- Switch workspaces with main + [0-9]
-- Move active window to a workspace with main + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(main .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(second .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(main .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(main .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces
hl.bind(main .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize tiles
hl.bind(main .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(main .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("hyprctl switchxkblayout keychron-keychron-k2-pro-keyboard next"))

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"), { mods = "SHIFT", locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"), { mods = "SHIFT", locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
