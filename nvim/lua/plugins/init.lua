local vim = vim
-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    is_bootstrap = true
    vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
end

local config = require('plugins.config.init')

local plugins = {
    'wbthomason/packer.nvim',

    'kyazdani42/nvim-web-devicons',
    { 'numToStr/Comment.nvim', config = config.comment },
    { 'folke/todo-comments.nvim', config = config.todo },
    { 'windwp/nvim-autopairs', config = config.autopair },
    { 'abecodes/tabout.nvim', config = config.tabout },
    { 'chentoast/marks.nvim', config = config.marks },
    { 'kylechui/nvim-surround', config = config.surround },
    { 'folke/tokyonight.nvim', config = config.theme },

    { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' },
        after = 'telescope-fzf-native.nvim', config = config.telescope },
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 },
    { 'akinsho/bufferline.nvim', after = 'tokyonight.nvim', config = config.bufferline },
    { 'lukas-reineke/indent-blankline.nvim', config = config.indent },
    { 'hoob3rt/lualine.nvim', config = config.lualine },
    { 'akinsho/toggleterm.nvim', config = config.toggleterm },
    'famiu/bufdelete.nvim',
    { 'kyazdani42/nvim-tree.lua', config = config.filetree },
    { 'simrat39/symbols-outline.nvim', config = config.outline },
    -- concrete syntax tree for source file
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = config.treesitter },
    { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
    { -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        requires = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'hrsh7th/cmp-nvim-lsp',
        },
        config = config.lsp
    },
    { -- Autocompletion
        'hrsh7th/nvim-cmp',
        requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-buffer' },
        config = config.cmp,
    },
    -- format
    { 'jose-elias-alvarez/null-ls.nvim', config = config.nullls },
    -- lua for nvim plugin dev
    { 'folke/lua-dev.nvim', config = config.neodev },
    -- orgmode !!!
    { 'nvim-neorg/neorg', config = config.neorg },

    -- { 'edluffy/hologram.nvim', config = config.hologram },

    -- debugger
    { 'mfussenegger/nvim-dap', requires = { 'rcarriga/nvim-dap-ui' }, config = config.dap },
    -- debug for golang, need pacman -S delve
    -- 'leoluz/nvim-dap-go',
    -- debug for rust
    -- 'simrat39/rust-tools.nvim',

    { 'glepnir/lspsaga.nvim', config = config.lspsaga },
    'onsails/lspkind-nvim',
    { 'ray-x/lsp_signature.nvim', config = config.signature },
    { 'phaazon/hop.nvim', config = config.hop },
    -- {'rcarriga/nvim-notify', config = config.notify},
    {'ch3n9w/nvim-github-uploader', config = config.imguploader},
}


require('packer').startup(function(use)
    if is_bootstrap then
        require('packer').sync()
    end
    for _, plugin in pairs(plugins) do use(plugin) end
end)
