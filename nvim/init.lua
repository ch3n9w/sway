package.path = package.path .. "./lua/?/init.lua"



require 'base'
require 'keymap'
require 'plugins'
-- local upload = dofile('/home/ch4ser/Projects/nvim-github-uploader/lua/nvim-github-uploader.lua')
-- upload.setup()

vim.cmd("source $VIMRUNTIME/mswin.vim")

