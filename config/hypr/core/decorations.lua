hl.config({
    decoration = {
        rounding       = 20,
        rounding_power = 5,

        -- Transparency of focused and unfocused windows
        active_opacity   = 0.9,
        inactive_opacity = 0.9,

        shadow = {
            enabled = true,
            range = 30,
            render_power = 8,
            color = "rgba(00000099)",
        },

        blur = {
            enabled   = true,
            size      = 4,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})
