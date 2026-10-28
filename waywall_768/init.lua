-- ==== WAYWALL GENERIC CONFIG ====
local main = require("main")

local remaps = require("remaps")

local cfg = {
    -- ==== LOOKS ====
    resolution = { 1366, 768 },

    bg_col = "#000000",
    toggle_bg_picture = false,
    text_col = "#D3D3D3",
    pie_chart_1 = "#EC6E4E",
    pie_chart_2 = "#46CE66",
    pie_chart_3 = "#E446C4",

    ninbot_anchor = {
        position = "topleft", -- topleft, top, topright, left, right, bottomleft, bottomright
        x = 0,
        y = 0,               -- offset
    },
    ninbot_opacity = 1,        -- 0 to 1

    -- ==== ALTERNATIVE RESOLUTIONS ====
    thin_res = { 340, 768 },
    wide_res = { 1366, 300 },
    tall_res = { 384, 16384 },


    -- ==== MIRRORS ====
    e_count = { enabled = true, x = 885, y = 300, size = 5, colorkey = true, show_c = true },

    thin_pie = { enabled = false, x = 875, y = 420, size = 3, colorkey = false }, -- Turning off colorkeying also maintains the original pie chart's dimensions and shows the percentages
    tall_pie = { enabled = true, x = 875, y = 420, size = 3, colorkey = false }, -- Leave same as thin for seamlessness

    thin_percent = { enabled = true, x = 600, y = 415, size = 4 },
    tall_percent = { enabled = true, x = 950, y = 465, size = 4 }, -- Leave same as thin for seamlessness
    percentages_match_text = true,                                  -- Enabling this makes the percentages match the text color rather than the pie colors


    measuring_window = { x = 0, y = 384, size = 8 },
    stretched_measure = true,


    -- ==== MACROS ====
    -- resolution changes
    thin = { key = "*-F9", f3_safe = false, ingame_only = false },
    wide = { key = "*-GRAVE", f3_safe = true, ingame_only = false },
    tall = { key = "*-F5", f3_safe = false, ingame_only = false },

    -- startup actions
    toggle_fullscreen_key = "Shift-O",
    launch_paceman_key = "Shift-P",

    -- during game actions
    toggle_ninbot_key = "*-F4",
    toggle_remaps_key = "Insert",


    -- ==== KEYBOARD ====
    xkb_config = {     -- set any setting to nil if unwanted
        enabled = true,
        layout = "mc", -- ~/.config/xkb/symbols/mc
        rules = nil,   -- ~/.config/xkb/rules/...
        variant = "basic",
        options = "caps:none",
    },
    remaps_text_config = { text = "chat mode", x = 100, y = 100, size = 2, color = "#000000" },


    -- ==== MISC ====
    sens_change = { enabled = true, normal = 3.35544336, tall = 0.2263562, raw_input = false }, -- setting raw_input to true will enable sens changing via maccel
    enable_resize_animations = false,

}

return main(cfg, remaps)
