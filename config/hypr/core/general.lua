hl.config({
    general = {
        gaps_in = 9,
        gaps_out = 18,
        border_size = 3,

        col = {
            active_border = {
                colors = {
                    colors.primary,
                    colors.secondary,
                },
                angle = 0
            },

            inactive_border = colors.outline_variant,
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    misc = {
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
    },
})
