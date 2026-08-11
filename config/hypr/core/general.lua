hl.config({
    general = {
        gaps_in = 9,
        gaps_out = 18,
        border_size = 0,

        col = {
            active_border = {
                colors = {
                    "rgb(0, 0, 0)",
                    "rgb(0, 0, 0)",
                },
                angle = 0
            },

            inactive_border = "rgb(0, 0, 0)",
        },

        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",        
    },
    
    misc = {
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
    }
})
