local monitors = {
    {
        output = "DP-1",
        mode = "3440x1440@165",
        position = "2560x0",
        scale = "1",
    },
    {
        output = "DP-2",
        mode = "2560x1440@165",
        position = "0x0",
        scale = "1",
    },
}

for _, monitor in ipairs(monitors) do
    hl.monitor(monitor)
end