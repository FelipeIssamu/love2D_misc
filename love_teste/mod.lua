local mod = require('love')

mod.print = function ()
    mod.graphics.print("hello", 100, 200)
end

return mod
