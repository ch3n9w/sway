package.path = package.path .. "./lua/?/init.lua"



require 'base'
require 'keymap'
require 'plugins'

vim.cmd("source $VIMRUNTIME/mswin.vim")
