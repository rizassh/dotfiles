-- ~/.config/hypr/monitors.lua

-- HDR variant of DP-1 (was commented out in monitors.conf):
-- hl.monitor({
--     output        = "DP-1",
--     mode          = "2560x1440@170.0",
--     position      = "4480x0",
--     scale         = 1.25,
--     bitdepth      = 10,
--     vrr           = 1,
--     cm            = "hdredid",
--     sdrbrightness = 1.5,
--     sdrsaturation = 0.9,
-- })

hl.monitor({
    output   = "DP-1",
    mode     = "2560x1440@170.0",
    position = "4480x0",
    scale    = 1.25,
})

hl.monitor({
    output   = "DP-3",
    mode     = "1920x1080@119.98",
    position = "2560x0",
    scale    = 1,
})
