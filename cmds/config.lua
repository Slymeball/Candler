events.TICK:register(function()
    if candler then
        candler.lib.setCommand("Candler", "config", {
            description = "Set a configuration option for Candler or print the config.",
            aliases = {"candconfig"},
            arguments = {
                {
                    name = "key",
                    description = "The option to change. If left blank, the config will be printed out.",
                    required = false
                },
                {
                    name = "value",
                    description = "The value to change it to.",
                    required = false
                }
            }
        }, function (args)
            if not args[1] then
                printTable(candler.config)
                return
            end
            if not candler.config[args[1]] then
                printJson('[{"text":"ERROR!", "color":"red", "bold":true}, {"text":" This config option does not exist! Maybe check for typos?", "color":"gray", "bold":false}]')
                return
            end
            -- if true then
            print(type(candler.config[args[1]]))
            if type(candler.config[args[1]]) == "number" then
                if not tonumber(args[2]) then
                    printJson('[{"text":"ERROR!", "color":"red", "bold":true}, {"text":" Incorrect type! This is a ' .. type(candler.config[args[1]]) .. '!", "color":"gray", "bold":false}]')
                    return
                end
                args[2] = tonumber(args[2])
            end
            saveToConfig(args[1], args[2])
            printJson('[{"text":"", "color":"gray"},{"text":"✔", "color":"green"}," Set config ",{"text":"' .. args[1] .. '","color":"green"}," to ",{"text":"' .. tostring(args[2]) .. '","color":"green"},"."]')
        end)
        events.TICK:remove("reg.candler.config")
    end
end, "reg.candler.config")