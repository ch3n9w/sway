local vim = vim
-- Install packer
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local config = require('plugins.config.init')

local plugins = {
    'wbthomason/packer.nvim',

    'kyazdani42/nvim-web-devicons',
    { "dstein64/vim-startuptime", cmd = "StartupTime" },
    { 'numToStr/Comment.nvim', config = config.comment },
    { 'windwp/nvim-autopairs', config = true, event = { 'InsertEnter' } },
    { 'abecodes/tabout.nvim', config = config.tabout, event = { 'InsertEnter' } },
    { 'chentoast/marks.nvim', config = config.marks },
    { 'kylechui/nvim-surround', config = true },
    { 'folke/tokyonight.nvim', lazy = false, priority = 1000,config = config.theme },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        cmd = { 'Telescope' },
        config = config.telescope,
    },
    { 'akinsho/bufferline.nvim', event = 'BufReadPre', config = config.bufferline },
    { 'lukas-reineke/indent-blankline.nvim', event = 'BufRead', config = config.indent },
    { 'hoob3rt/lualine.nvim', config = config.lualine },
    { 'akinsho/toggleterm.nvim', config = config.toggleterm, cmd = { 'ToggleTerm' } },
    { 'famiu/bufdelete.nvim', event = 'BufRead' },
    { 'kyazdani42/nvim-tree.lua', config = config.filetree, cmd = { 'NvimTreeToggle' } },
    { 'simrat39/symbols-outline.nvim', config = config.outline, cmd = { 'SymbolsOutline' } },
    -- concrete syntax tree for source file
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate', event = 'BufRead', config = config.treesitter },
    {
        'williamboman/mason.nvim',
        dependencies = { 'williamboman/mason-lspconfig.nvim', },
        cmd = {'Mason', 'MasonInstall'},
        config = config.mason
    },
{
    'neovim/nvim-lspconfig',
    event = 'BufReadPre',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        }
    },
    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-buffer'
        },
        config = config.cmp,
    },
    -- format
    { 'jose-elias-alvarez/null-ls.nvim', event = 'BufReadPre', dependencies = { 'williamboman/mason.nvim' }, config = config.nullls },
    -- lua for nvim plugin dev
    { 'folke/neodev.nvim', config = true, ft = 'lua' },
    -- orgmode !!!
    { 'nvim-neorg/neorg', config = config.neorg, ft = 'norg' },

    -- debugger
    { 'mfussenegger/nvim-dap', dependencies = { 'rcarriga/nvim-dap-ui' }, config = config.dap, ft = 'go' },

    { 'glepnir/lspsaga.nvim', config = config.lspsaga, cmd = { 'Lspsaga' } },
    'onsails/lspkind-nvim',
    { 'ray-x/lsp_signature.nvim', config = true},
    { 'phaazon/hop.nvim', config = config.hop, cmd = { 'HopWord' } },
    { 'ch3n9w/nvim-github-uploader', config = config.imguploader, ft = 'markdown' },
}

require("lazy").setup(plugins)
