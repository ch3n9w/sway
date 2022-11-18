local edit_plugins = require('plugins.edit')
local interface_plugins = require('plugins.interface')
local theme_plugins = require('plugins.theme')
local lsp_plugins = require('plugins.lsp')


require('packer').startup(
    function(use)
        for _, plugin in pairs(interface_plugins.plugins) do use(plugin) end
        for _, plugin in pairs(theme_plugins.plugins) do use(plugin) end
        for _, plugin in pairs(lsp_plugins.plugins) do use(plugin) end
        for _, plugin in pairs(edit_plugins.plugins) do use(plugin) end
    end
)


interface_plugins.load()
theme_plugins.load()
lsp_plugins.load()
-- editor's plugin must load after lsp plugins
edit_plugins.load()
