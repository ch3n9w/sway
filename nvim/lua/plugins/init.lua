local edit_plugins = require('plugins.edit')
local interface_plugins = require('plugins.interface')
local theme_plugins = require('plugins.theme')
local lsp_plugins = require('plugins.lsp')
local motion_plugins = require('plugins.motion')
local finder_plugins = require('plugins.finder')
local dependency_plugins = require('plugins.dependency')



require('packer').startup(
    function(use)
        for _, plugin in pairs(dependency_plugins.plugins) do use(plugin) end
        for _, plugin in pairs(interface_plugins.plugins) do use(plugin) end
        for _, plugin in pairs(theme_plugins.plugins) do use(plugin) end
        for _, plugin in pairs(lsp_plugins.plugins) do use(plugin) end
        for _, plugin in pairs(edit_plugins.plugins) do use(plugin) end
        for _, plugin in pairs(motion_plugins.plugins) do use(plugin) end
        for _, plugin in pairs(finder_plugins.plugins) do use(plugin) end
    end
)


-- theme must load first, otherwise bufferline will have problem
theme_plugins.load()
motion_plugins.load()
interface_plugins.load()
finder_plugins.load()
lsp_plugins.load()
-- editor's plugin must load after lsp plugins
edit_plugins.load()
