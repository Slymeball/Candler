events.TICK:register(function()
    if candler then
        candler.lib.newCategory("Examples", {
            description     = "Examples to show how to make a simple command.",
            author          = "Slymeball",
            version         = "0.1.1",
            website         = "https://github.com/Slymeball/Candler/tree/main/cmds/examples",
            issues          = "https://github.com/Slymeball/Candler/issues"
        })
        events.TICK:remove("reg.examples")
    end
end, "reg.examples")