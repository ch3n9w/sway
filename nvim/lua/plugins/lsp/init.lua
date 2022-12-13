local dap = require('plugins.lsp.dap')
local lsp_signature = require('plugins.lsp.lsp_signature')
local lspsaga = require('plugins.lsp.lspsaga')
local neodev = require('plugins.lsp.neodev')
local neorg = require('plugins.lsp.neorg')
local nvim_cmp = require('plugins.lsp.nvim-cmp')
local nvim_lsp = require('plugins.lsp.nvim-lsp')
local nvim_treesitter = require('plugins.lsp.nvim-treesitter')
local null_ls = require('plugins.lsp.null-ls')
Lsp_plugins = {}

Lsp_plugins.plugins = {
    -- concrete syntax tree for source file
    {'nvim-treesitter/nvim-treesitter', run=':TSUpdate'},
    -- LSP support
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',

    -- format
    'jose-elias-alvarez/null-ls.nvim',
    -- lua for nvim plugin dev
    'folke/lua-dev.nvim',
    -- orgmode !!!
    {'nvim-neorg/neorg'},

    'williamboman/nvim-lsp-installer',
    -- debugger
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    -- debug for golang, need pacman -S delve
    -- 'leoluz/nvim-dap-go',
    -- debug for rust
    -- 'simrat39/rust-tools.nvim',

    -- code action
    'glepnir/lspsaga.nvim',
    -- completion icon set
    'onsails/lspkind-nvim',
    'ray-x/lsp_signature.nvim',
}

function Lsp_plugins.load()
    dap.load()
    lsp_signature.load()
    lspsaga.load()
    neodev.load()
    neorg.load()
    nvim_cmp.load()
    nvim_lsp.load()
    nvim_treesitter.load()
    null_ls.load()
    vim.o.completeopt='menu,menuone,noselect'
end




return Lsp_plugins
