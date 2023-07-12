require(... .. ".register")

events.TICK:register(function()
    if candler then
        candler.lib.setCommand("Examples", "alias", {
            command = "alias", -- The main command that should be shown on help pages.
            aliases = {"what", "command", "was", "used"}, -- Every other command that should lead to this file.
            description = "Repeats what alias was used.", -- A description of the command.
            arguments = {}
        }, function (_, alias)
            print("Alias used: " .. alias)
        end)
        events.TICK:remove("reg.examples.alias")
    end
end, "reg.examples.alias")