Lsp = {}

function Lsp.init()
    require('nvim-treesitter.configs').setup {
        ensure_installed = {"rust","go","c","python","php","html","json","css","lua","bash","markdown","javascript","typescript"},
        highlight = {
            enable = true,
        },
    }
    require('lsp_signature').setup({ hint_prefix = " " })
    require('nvim-lsp-installer').setup {}
    require('lspsaga').init_lsp_saga()
    local lspconfig = require('lspconfig')
    -- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require("neodev").setup({})

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
    lspconfig.sumneko_lua.setup {
        settings = {
            Lua = {
                completion = {
                    callSnippet = "Replace"
                },
                diagnostics = {
                    globals = { "vim" }
                },
            }
        }
    }
    local other_servers = {"bashls", "rome"}
    for _, server in ipairs(other_servers) do
        lspconfig[server].setup {
            capabilities = capabilities,
            single_file_mode = true
        }
    end
end

return Lsp
