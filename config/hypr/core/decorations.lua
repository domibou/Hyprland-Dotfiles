hl.config({
    decoration = {
        rounding       = 15,
        rounding_power = 3,

        -- Transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled = true,
            range = 30,
            render_power = 8,
            color = "rgba(00000099)",
        },

        blur = {
            enabled   = true,
            size      = 6,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})
