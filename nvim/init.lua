package.path = package.path .. "./lua/?/init.lua"



require 'base'
require 'keymap'
require 'plugins'
-- local upload = dofile('/home/ch4ser/Projects/nvim-github-uploader/lua/nvim-github-uploader.lua')
-- upload.setup()

-- dont know what this is used for
-- but currently this will cause problem as visual mode behaves abnormally
-- this file should be used for windows neovim
-- vim.cmd("source $VIMRUNTIME/mswin.vim")

