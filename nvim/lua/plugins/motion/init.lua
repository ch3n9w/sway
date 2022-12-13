local hop = require('plugins.motion.hop')

local motion_plugins = {}

motion_plugins.plugins = {
    'phaazon/hop.nvim',
}

function motion_plugins.load()
    hop.load()
end

return motion_plugins
