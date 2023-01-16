M = {}
M.load = function ()
    require('nvim-lsp-installer').setup {}
    local lspconfig = require('lspconfig')
    -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    lspconfig.intelephense.setup {
        capabilities = capabilities,
        init_options = {
            -- for intelephense
            licenceKey='/home/ch4ser/.config/nvim/intelephense_license_key',
            globalStoragePath='/home/ch4ser/.config',
        },
        single_file_mode=true
    }
    lspconfig.pyright.setup {
        capabilities = capabilities,
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    useLibraryCodeForTypes = true,
                    diagnosticMode = 'workspace',
                    typeCheckingMode = 'off'
                },
            },
        },
    }
    -- lspconfig.sumneko_lua.setup {
    --     capabilities = capabilities,
    --     settings = {
    --         Lua = {
    --             diagnostics = {
    --                 globals = { "vim" }
    --             },
    --         }
    --     }
    -- }
    local other_servers = {"bashls", "rome", "gopls", "sumneko_lua", "clangd", "rust_analyzer"}
    for _, server in ipairs(other_servers) do
        lspconfig[server].setup {
            capabilities = capabilities,
            single_file_mode = true,
        }
    end
end
return M
