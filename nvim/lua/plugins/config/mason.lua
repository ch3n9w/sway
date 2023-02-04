M = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
        ensure_installed = {
            "rome",
            "gopls",
            "sumneko_lua",
            "clangd",
            "rust_analyzer",
            "pyright",
            "intelephense",
        },
    })
end

return M
