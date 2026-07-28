hl.config({
    general = {
        gaps_in = 12,
        gaps_out = 25,
        border_size = 2,

        col = {
            active_border = {
                colors = {
                    "rgba(41, 41, 41, 1)",
                    "rgba(41, 41, 41, 1)"
                },
                angle = 0 
            },

            inactive_border = "rgba(22, 22, 22, 1)",
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
