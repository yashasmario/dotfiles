local waywall = require("waywall")
local helpers = require("waywall.helpers")

return function(config)
    -- Add any extra code here
    local normal_remaps = config.input.remaps -- whatever remaps.lua 

    local searchcraft_remaps = {
        ["MB4"] = "HOME",
        ["MB5"] = "BACKSPACE",
    }

    waywall.listen("state", function()
        local state = waywall.state()
        if state.screen == "inworld" and state.inworld == "menu" then
            waywall.set_remaps(searchcraft_remaps)
        else
            waywall.set_remaps(normal_remaps)
        end
    end)
    -- searchcraft END 

end
