-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ch4ser/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ch4ser/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ch4ser/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ch4ser/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ch4ser/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/bufdelete.nvim",
    url = "https://github.com/famiu/bufdelete.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\ng\0\1\5\0\a\0\0149\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\15\0\1\0X\2\6Ä6\1\3\0009\1\4\0019\1\5\0019\3\0\0'\4\6\0D\1\3\0K\0\1\0\t:t:r\16fnamemodify\afn\bvim\t%.md\nmatch\tname\31\0\4\a\0\2\0\5'\4\0\0\18\5\0\0'\6\1\0&\4\6\4L\4\2\0\6)\6(Ó\1\0\1\4\0\n\0 6\1\0\0009\1\1\0018\1\0\0019\1\2\1\6\1\3\0X\1\2Ä+\1\2\0L\1\2\0006\1\0\0009\1\4\0019\1\5\1\18\3\0\0B\1\2\2\6\1\6\0X\1\2Ä+\1\2\0L\1\2\0006\1\0\0009\1\4\0019\1\a\1B\1\1\2\a\1\b\0X\1\bÄ6\1\0\0009\1\1\0018\1\0\0019\1\2\1\6\1\t\0X\1\2Ä+\1\2\0L\1\2\0K\0\1\0\twiki\16<work-repo>\vgetcwd\30<buffer-name-I-dont-want>\fbufname\afn\30<i-dont-want-to-see-this>\rfiletype\abo\bvimÃ\4\1\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\3\0005\4\4\0=\4\5\0033\4\6\0=\4\a\0033\4\b\0=\4\t\0033\4\n\0=\4\v\3=\3\r\2B\0\2\1K\0\1\0\foptions\1\0\0\18custom_filter\0\26diagnostics_indicator\0\19name_formatter\0\14indicator\1\0\2\nstyle\14underline\ticon\6>\1\0\19\18close_command\15Bdelete %d\22buffer_close_icon\bÔÄç\28show_buffer_close_icons\2\20show_close_icon\1\23left_mouse_command\14buffer %d\24persist_buffer_sort\2\27always_show_bufferline\2\16diagnostics\rnvim_lsp\rtab_size\3\18\22max_prefix_length\3\15\20max_name_length\3\18\fsort_by\aid\25enforce_regular_tabs\2\23right_trunc_marker\bÔÇ©\24show_tab_indicators\2\22left_trunc_marker\bÔÇ®\15close_icon\bÔÄç\22show_buffer_icons\2\18modified_icon\b‚óè\nsetup\15bufferline\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nd\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\tkeys\28etovxqpdygfblzhckisuran\18extend_visual\2\nsetup\bhop\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nw\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\25show_current_context\2\31show_current_context_start\2\nsetup\21indent_blankline\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\16hint_prefix\tÔê£ \nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n‡\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\27definition_action_keys\1\0\3\tquit\n<ESC>\vvsplit\6v\tedit\t<CR>\21code_action_keys\1\0\2\23rename_action_quit\n<ESC>\21code_action_icon\5\1\0\2\texec\t<CR>\tquit\n<ESC>\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneodev\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n€\2\0\0\a\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\19\0005\3\a\0005\4\6\0005\5\3\0005\6\4\0=\6\5\5>\5\1\4=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\20\2B\0\2\1K\0\1\0\rsections\1\0\0\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\rencoding\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\3\0\0\tdiff\16diagnostics\14lualine_a\1\0\0\1\3\0\0\0\tmode\fsymbols\1\0\3\bdos\bÓúè\bmac\bÓúë\tunix\bÔåÉ\1\2\0\0\15fileformat\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/hoob3rt/lualine.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\nô\2\0\0\4\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0024\3\0\0=\3\6\0025\3\a\0=\3\b\0024\3\0\0=\3\t\2B\0\2\1K\0\1\0\rmappings\15bookmark_0\1\0\3\14virt_text\5\tsign\b‚öë\rannotate\1\23excluded_filetypes\18sign_priority\1\0\4\fbuiltin\3\b\nupper\3\15\nlower\3\n\rbookmark\3\20\1\0\4\21refresh_interval\3˙\1\22force_write_shada\1\vcyclic\2\21default_mappings\1\nsetup\nmarks\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  neorg = {
    config = { "\27LJ\2\nà\2\0\0\6\0\15\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0034\4\0\0=\4\6\0035\4\b\0005\5\a\0=\5\t\4=\4\n\0034\4\0\0=\4\v\0034\4\0\0=\4\f\3=\3\14\2B\0\2\1K\0\1\0\tload\1\0\0\16core.export\22core.norg.qol.toc\25core.norg.completion\vconfig\1\0\0\1\0\1\vengine\rnvim-cmp\24core.norg.manoeuvre\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/neorg",
    url = "https://github.com/nvim-neorg/neorg"
  },
  ["null-ls.nvim"] = {
    config = { "\27LJ\2\nû\2\0\0\r\0\18\0\"6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\16\0004\4\4\0009\5\3\0009\5\4\0059\5\5\0059\5\6\0055\a\f\0004\b\3\0'\t\a\0006\n\b\0009\n\t\n9\n\n\n'\f\v\0B\n\2\2&\t\n\t>\t\1\b=\b\r\aB\5\2\2>\5\1\0049\5\3\0009\5\4\0059\5\14\5>\5\2\0049\5\3\0009\5\4\0059\5\15\5>\5\3\4=\4\17\3B\1\2\1K\0\1\0\fsources\1\0\0\17markdown_toc\nblack\15extra_args\1\0\0\21{IndentWidth: 4}\vexpand\afn\bvim\f-style=\twith\17clang_format\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire[\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\19expand_or_jump\23expand_or_jumpableO\0\1\4\1\2\0\14-\1\0\0009\1\0\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\0\0009\1\1\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\tjump\rjumpableR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_prev_item\fvisible£\t\1\0\r\0E\0w6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0024\4\t\0005\5\5\0>\5\1\0045\5\6\0>\5\2\0045\5\a\0>\5\3\0045\5\b\0>\5\4\0045\5\t\0>\5\5\0045\5\n\0>\5\6\0045\5\v\0>\5\a\0045\5\f\0>\5\b\0049\5\r\0005\a\15\0005\b\14\0=\b\16\a5\b\19\0005\t\17\0=\4\18\t=\t\16\b5\t\20\0=\t\21\b=\b\22\a5\b\24\0003\t\23\0=\t\25\b=\b\26\a5\b\29\0009\t\27\0025\v\28\0B\t\2\2=\t\30\b=\b\31\a5\b\"\0009\t \0009\t!\tB\t\1\2=\t#\b9\t \0009\t$\t5\v%\0B\t\2\2=\t&\b9\t \0003\v'\0005\f(\0B\t\3\2=\t)\b9\t \0003\v*\0005\f+\0B\t\3\2=\t,\b9\t \0003\v-\0005\f.\0B\t\3\2=\t/\b9\t \0003\v0\0005\f1\0B\t\3\2=\t2\b=\b \a9\b3\0009\b4\b4\n\5\0005\v5\0>\v\1\n5\v6\0>\v\2\n5\v7\0>\v\3\n5\v8\0>\v\4\nB\b\2\2=\b4\a5\b9\0004\t\n\0009\n:\1>\n\1\t9\n;\1>\n\2\t9\n<\1>\n\3\t9\n=\1>\n\4\t9\n>\1>\n\5\t9\n?\1>\n\6\t9\n@\1>\n\a\t9\nA\1>\n\b\t9\nB\1>\n\t\t=\tC\b=\bD\aB\5\2\0012\0\0ÄK\0\1\0\fsorting\16comparators\norder\vlength\14sort_text\tkind\rlocality\nscore\18recently_used\nexact\voffset\1\0\1\20priority_weight\3\1\1\0\1\tname\nneorg\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<Up>\1\3\0\0\6i\6s\0\v<Down>\1\3\0\0\6i\6s\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-q>\1\0\0\nclose\fmapping\15formatting\vformat\1\0\0\1\0\2\rmaxwidth\0032\tmode\vsymbol\15cmp_format\fsnippet\vexpand\1\0\0\0\vwindow\18documentation\1\0\1\vborder\frounded\1\0\0\vborder\1\0\1\14scrollbar\b‚ïë\15completion\1\0\0\1\0\1\16completeopt\26menu,menuone,noinsert\nsetup\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚îî\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚îò\16FloatBorder\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚îê\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚îå\16FloatBorder\fluasnip\flspkind\23cmp.config.compare\bcmp\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\nH\0\0\3\1\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\1-\0\0\0009\0\3\0004\2\0\0B\0\2\1K\0\1\0\1¿\topen\18NvimTreeClose\bcmd\bvim#\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\1¿\nclose#\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\1¿\ncloseg\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvim˙\a\1\0\t\0)\0K6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\2\0B\2\2\0029\2\3\0025\4\a\0004\5\3\0005\6\5\0004\a\3\0005\b\4\0>\b\1\a=\a\6\6>\6\1\5=\5\b\0045\5\t\0=\5\n\4B\2\2\0019\2\v\0009\2\f\0029\2\r\0023\3\15\0=\3\14\0029\2\v\0009\2\16\0029\2\17\0023\3\18\0=\3\14\0029\2\v\0009\2\16\0029\2\19\0023\3\20\0=\3\14\0029\2\21\0005\3\23\0=\3\22\0029\2\21\0005\3\25\0005\4\26\0005\5\27\0=\5\28\4=\4\29\3=\3\24\0029\2\30\0004\3\3\0005\4 \0003\5!\0=\5\"\0044\5\0\0=\5\28\4>\4\1\3=\3\31\0029\2\30\0009\3\30\0009\3\31\3=\3#\0029\2\30\0009\3\30\0009\3\31\3=\3$\0029\2\30\0004\3\4\0005\4&\0>\4\1\0035\4'\0>\4\2\0035\4(\0>\4\3\3=\3%\0022\0\0ÄK\0\1\0\1\0\5\ttype\ndelve\tmode\ttest\frequest\vlaunch\fprogram\29./${relativeFileDirname}\tname\24Debug test (go.mod)\1\0\5\ttype\ndelve\tmode\ttest\frequest\vlaunch\fprogram\f${file}\tname\15Debug test\1\0\4\ttype\ndelve\frequest\vlaunch\fprogram\f${file}\tname\nDebug\ago\bcpp\6c\fprogram\0\1\0\5\ttype\tlldb\16stopOnEntry\1\bcwd\23${workspaceFolder}\frequest\vlaunch\tname\vLaunch\trust\19configurations\15executable\targs\1\4\0\0\bdap\a-l\022127.0.0.1:${port}\1\0\1\fcommand\bdlv\1\0\2\ttype\vserver\tport\f${port}\ndelve\1\0\3\ttype\15executable\tname\tlldb\fcommand\25/usr/bin/lldb-vscode\tlldb\radapters\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\rcontrols\1\0\1\fenabled\1\flayouts\1\0\0\relements\1\0\2\rposition\vbottom\tsize\3\a\1\0\2\tsize\4ö≥ÊÃ\tô≥Ê˝\3\aid\vscopes\nsetup\ndapui\bdap\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nñ\5\0\0\v\0\23\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\4\0B\0\2\0026\1\0\0'\3\5\0B\1\2\0029\1\6\1B\1\1\0029\2\a\0009\2\2\0025\4\b\0=\1\t\0045\5\n\0=\5\v\4B\2\2\0019\2\f\0009\2\2\0025\4\r\0=\1\t\0045\5\17\0005\6\15\0005\a\14\0=\a\16\6=\6\18\5=\5\19\4B\2\2\0015\2\20\0006\3\21\0\18\5\2\0B\3\2\4X\6\5Ä8\b\a\0009\b\2\b5\n\22\0=\1\t\nB\b\2\1E\6\3\3R\6˘\127K\0\1\0\1\0\1\21single_file_mode\2\vipairs\1\a\0\0\vbashls\trome\ngopls\16sumneko_lua\vclangd\18rust_analyzer\rsettings\vpython\1\0\0\ranalysis\1\0\0\1\0\4\21typeCheckingMode\boff\19diagnosticMode\14workspace\27useLibraryCodeForTypes\2\20autoSearchPaths\2\1\0\0\fpyright\17init_options\1\0\2\15licenceKey7/home/ch4ser/.config/nvim/intelephense_license_key\22globalStoragePath\25/home/ch4ser/.config\17capabilities\1\0\1\21single_file_mode\2\17intelephense\25default_capabilities\17cmp_nvim_lsp\14lspconfig\20mason-lspconfig\nsetup\nmason\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\20NvimTreeRefresh\bcmd\bvimÎ\1\0\0\a\1\15\0\0256\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0029\2\3\1\a\2\4\0X\2\nÄ6\2\5\0009\2\6\0029\2\a\2'\4\b\0009\5\t\1'\6\n\0&\4\6\0045\5\v\0B\2\3\1X\2\6Ä-\2\0\0009\2\f\0029\2\r\0029\2\14\2\18\4\1\0B\2\2\1K\0\1\0\0¿\tedit\topen\tnode\1\0\1\vdetach\2\b' &\18absolute_path\15xdg-open '\rjobstart\afn\bvim\bpdf\14extension\23get_node_at_cursor\18nvim-tree.lib\frequireä\a\1\0\n\0\"\0/6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0013\3\4\0B\1\2\0013\1\5\0006\2\0\0'\4\6\0B\2\2\0029\2\a\0025\4\b\0004\5\0\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0005\6\r\0=\6\14\5=\5\15\0045\5\16\0005\6\21\0004\a\3\0005\b\18\0005\t\17\0=\t\19\b=\1\20\b>\b\1\a=\a\22\6=\6\23\5=\5\24\0045\5\26\0005\6\25\0=\6\27\5=\5\28\0045\5\29\0004\6\0\0=\6\30\5=\5\31\0045\5 \0=\5!\4B\2\2\0012\0\0ÄK\0\1\0\rrenderer\1\0\1\27highlight_opened_files\ball\24update_focused_file\16ignore_list\1\0\2\venable\2\15update_cwd\1\ffilters\vcustom\1\0\0\1\2\0\0\b^\\.\tview\rmappings\tlist\1\0\0\14action_cb\bkey\1\0\1\vaction\20nvimtreexdgopen\1\4\0\0\t<CR>\6o\18<2-LeftMouse>\1\0\a\vnumber\1\19relativenumber\1 preserve_window_proportions\2\15signcolumn\byes\tside\tleft\21hide_root_folder\1\nwidth\3\20\16diagnostics\nicons\1\0\4\fwarning\bÔÅ±\tinfo\bÔÅö\nerror\bÔÅó\thint\bÔÅ™\1\0\1\venable\2\23hijack_directories\1\0\2\venable\2\14auto_open\2\23ignore_ft_on_setup\1\0\n\18hijack_cursor\2'hijack_unnamed_buffer_when_opening\1\23sync_root_with_cwd\2\15update_cwd\2\16open_on_tab\2\25auto_reload_on_write\2\27ignore_buffer_on_setup\1\18open_on_setup\1\17hijack_netrw\2\18disable_netrw\2\nsetup\14nvim-tree\0\0\23on_nvim_tree_ready\21nvim-tree.events\18nvim-tree.api\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects" },
    config = { "\27LJ\2\nô\2\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\26incremental_selection\1\0\1\venable\1\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\15\0\0\trust\ago\6c\vpython\bphp\thtml\tjson\bcss\blua\tbash\rmarkdown\15javascript\15typescript\tnorg\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\nµ\2\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\fkeymaps\nclose\1\0\v\tfold\6h\17code_actions\6a\18rename_symbol\6r\19toggle_preview\6K\17hover_symbol\14<C-space>\19focus_location\6o\15fold_reset\6R\18goto_location\t<Cr>\15unfold_all\6E\rfold_all\6W\vunfold\6l\1\3\0\0\n<Esc>\6q\1\0\2\15auto_close\1\27highlight_hovered_item\2\nsetup\20symbols-outline\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\2\nÎ\2\0\0\5\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\a\0005\4\4\0>\4\1\0035\4\5\0>\4\2\0035\4\6\0>\4\3\0035\4\a\0>\4\4\0035\4\b\0>\4\5\0035\4\t\0>\4\6\3=\3\n\0024\3\0\0=\3\v\2B\0\2\1K\0\1\0\fexclude\ftabouts\1\0\2\nclose\6}\topen\6{\1\0\2\nclose\6]\topen\6[\1\0\2\nclose\6)\topen\6(\1\0\2\nclose\6`\topen\6`\1\0\2\nclose\6\"\topen\6\"\1\0\2\nclose\6'\topen\6'\1\0\a\15completion\1\21ignore_beginning\2\21enable_backwards\2\21act_as_shift_tab\1\15act_as_tab\2\21backwards_tabkey\f<S-Tab>\vtabkey\n<Tab>\nsetup\vtabout\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    after = { "telescope.nvim" },
    cond = { true },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nò\2\0\0\b\0\20\0\0306\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\16\0005\4\14\0005\5\f\0005\6\5\0009\a\4\0=\a\6\0069\a\a\0=\a\b\0069\a\a\0=\a\t\0069\a\n\0=\a\v\6=\6\r\5=\5\15\4=\4\17\3B\1\2\0016\1\0\0'\3\2\0B\1\2\0029\1\18\1'\3\19\0B\1\2\1K\0\1\0\bfzf\19load_extension\rdefaults\1\0\0\rmappings\1\0\0\6i\1\0\0\t<CR>\19select_default\n<Tab>\n<C-x>\20select_vertical\n<esc>\1\0\0\nclose\nsetup\14telescope\22telescope.actions\frequire\0" },
    load_after = {
      ["telescope-fzf-native.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20shade_terminals\1\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["tokyonight.nvim"] = {
    after = { "bufferline.nvim" },
    config = { "\27LJ\2\n\v\0\1\1\0\0\0\1K\0\1\0\v\0\2\2\0\0\0\1K\0\1\0å\5\1\0\t\0$\0B,\0\3\0006\4\0\0009\4\1\4'\6\2\0B\4\2\2\a\4\3\0X\4\5Ä+\0\1\0+\1\1\0'\3\4\0'\2\5\0X\4\15Ä6\4\0\0009\4\1\4'\6\2\0B\4\2\2\a\4\6\0X\4\5Ä+\0\1\0+\1\1\0'\3\4\0'\2\a\0X\4\4Ä+\0\2\0+\1\2\0'\3\b\0'\2\a\0006\4\t\0'\6\n\0B\4\2\0029\4\v\0045\6\f\0=\2\r\6=\0\b\0065\a\15\0005\b\14\0=\b\16\a5\b\17\0=\b\18\a4\b\0\0=\b\19\a4\b\0\0=\b\20\a=\3\21\a=\a\22\0065\a\23\0=\a\21\6=\1\24\0063\a\25\0=\a\26\0063\a\27\0=\a\28\6B\4\2\0016\4\t\0'\6\29\0B\4\2\0029\4\v\0045\6\31\0005\a\30\0=\a \6B\4\2\0016\4!\0009\4\"\4'\6#\0B\4\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\foptions\1\0\0\1\0\1\ntheme\15tokyonight\flualine\18on_highlights\0\14on_colors\0\17dim_inactive\1\3\0\0\aqf\thelp\vstyles\rsidebars\14variables\14functions\rkeywords\1\0\1\vitalic\2\rcomments\1\0\1\vfloats\tdark\1\0\1\vitalic\2\nstyle\1\0\4\29hide_inactive_statusline\1\19day_brightness\4ö≥ÊÃ\tô≥Ê˝\3\17lualine_bold\2\20terminal_colors\2\nsetup\15tokyonight\frequire\16transparent\nstorm\0062\nnight\tdark\0061\rNVIM_GUI\vgetenv\aos\0" },
    loaded = true,
    only_config = true,
    path = "/home/ch4ser/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\16hint_prefix\tÔê£ \nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\nP\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\20shade_terminals\1\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nô\2\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\26incremental_selection\1\0\1\venable\1\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\15\0\0\trust\ago\6c\vpython\bphp\thtml\tjson\bcss\blua\tbash\rmarkdown\15javascript\15typescript\tnorg\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n‡\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\27definition_action_keys\1\0\3\tquit\n<ESC>\vvsplit\6v\tedit\t<CR>\21code_action_keys\1\0\2\23rename_action_quit\n<ESC>\21code_action_icon\5\1\0\2\texec\t<CR>\tquit\n<ESC>\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\nµ\2\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\2B\0\2\1K\0\1\0\fkeymaps\nclose\1\0\v\tfold\6h\17code_actions\6a\18rename_symbol\6r\19toggle_preview\6K\17hover_symbol\14<C-space>\19focus_location\6o\15fold_reset\6R\18goto_location\t<Cr>\15unfold_all\6E\rfold_all\6W\vunfold\6l\1\3\0\0\n<Esc>\6q\1\0\2\15auto_close\1\27highlight_hovered_item\2\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\nH\0\0\3\1\4\0\t6\0\0\0009\0\1\0'\2\2\0B\0\2\1-\0\0\0009\0\3\0004\2\0\0B\0\2\1K\0\1\0\1¿\topen\18NvimTreeClose\bcmd\bvim#\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\1¿\nclose#\0\0\3\1\1\0\5-\0\0\0009\0\0\0004\2\0\0B\0\2\1K\0\1\0\1¿\ncloseg\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvim˙\a\1\0\t\0)\0K6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\2\0B\2\2\0029\2\3\0025\4\a\0004\5\3\0005\6\5\0004\a\3\0005\b\4\0>\b\1\a=\a\6\6>\6\1\5=\5\b\0045\5\t\0=\5\n\4B\2\2\0019\2\v\0009\2\f\0029\2\r\0023\3\15\0=\3\14\0029\2\v\0009\2\16\0029\2\17\0023\3\18\0=\3\14\0029\2\v\0009\2\16\0029\2\19\0023\3\20\0=\3\14\0029\2\21\0005\3\23\0=\3\22\0029\2\21\0005\3\25\0005\4\26\0005\5\27\0=\5\28\4=\4\29\3=\3\24\0029\2\30\0004\3\3\0005\4 \0003\5!\0=\5\"\0044\5\0\0=\5\28\4>\4\1\3=\3\31\0029\2\30\0009\3\30\0009\3\31\3=\3#\0029\2\30\0009\3\30\0009\3\31\3=\3$\0029\2\30\0004\3\4\0005\4&\0>\4\1\0035\4'\0>\4\2\0035\4(\0>\4\3\3=\3%\0022\0\0ÄK\0\1\0\1\0\5\ttype\ndelve\tmode\ttest\frequest\vlaunch\fprogram\29./${relativeFileDirname}\tname\24Debug test (go.mod)\1\0\5\ttype\ndelve\tmode\ttest\frequest\vlaunch\fprogram\f${file}\tname\15Debug test\1\0\4\ttype\ndelve\frequest\vlaunch\fprogram\f${file}\tname\nDebug\ago\bcpp\6c\fprogram\0\1\0\5\ttype\tlldb\16stopOnEntry\1\bcwd\23${workspaceFolder}\frequest\vlaunch\tname\vLaunch\trust\19configurations\15executable\targs\1\4\0\0\bdap\a-l\022127.0.0.1:${port}\1\0\1\fcommand\bdlv\1\0\2\ttype\vserver\tport\f${port}\ndelve\1\0\3\ttype\15executable\tname\tlldb\fcommand\25/usr/bin/lldb-vscode\tlldb\radapters\0\17event_exited\0\21event_terminated\vbefore\0\17dapui_config\22event_initialized\nafter\14listeners\rcontrols\1\0\1\fenabled\1\flayouts\1\0\0\relements\1\0\2\rposition\vbottom\tsize\3\a\1\0\2\tsize\4ö≥ÊÃ\tô≥Ê˝\3\aid\vscopes\nsetup\ndapui\bdap\frequire\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: lua-dev.nvim
time([[Config for lua-dev.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vneodev\frequire\0", "config", "lua-dev.nvim")
time([[Config for lua-dev.nvim]], false)
-- Config for: tabout.nvim
time([[Config for tabout.nvim]], true)
try_loadstring("\27LJ\2\nÎ\2\0\0\5\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\a\0005\4\4\0>\4\1\0035\4\5\0>\4\2\0035\4\6\0>\4\3\0035\4\a\0>\4\4\0035\4\b\0>\4\5\0035\4\t\0>\4\6\3=\3\n\0024\3\0\0=\3\v\2B\0\2\1K\0\1\0\fexclude\ftabouts\1\0\2\nclose\6}\topen\6{\1\0\2\nclose\6]\topen\6[\1\0\2\nclose\6)\topen\6(\1\0\2\nclose\6`\topen\6`\1\0\2\nclose\6\"\topen\6\"\1\0\2\nclose\6'\topen\6'\1\0\a\15completion\1\21ignore_beginning\2\21enable_backwards\2\21act_as_shift_tab\1\15act_as_tab\2\21backwards_tabkey\f<S-Tab>\vtabkey\n<Tab>\nsetup\vtabout\frequire\0", "config", "tabout.nvim")
time([[Config for tabout.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n€\2\0\0\a\0\21\0\0256\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\19\0005\3\a\0005\4\6\0005\5\3\0005\6\4\0=\6\5\5>\5\1\4=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\0035\4\r\0=\4\14\0035\4\15\0=\4\16\0035\4\17\0=\4\18\3=\3\20\2B\0\2\1K\0\1\0\rsections\1\0\0\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\3\0\0\rencoding\rfiletype\14lualine_c\1\2\0\0\rfilename\14lualine_b\1\3\0\0\tdiff\16diagnostics\14lualine_a\1\0\0\1\3\0\0\0\tmode\fsymbols\1\0\3\bdos\bÓúè\bmac\bÓúë\tunix\bÔåÉ\1\2\0\0\15fileformat\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nñ\5\0\0\v\0\23\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\4\0B\0\2\0026\1\0\0'\3\5\0B\1\2\0029\1\6\1B\1\1\0029\2\a\0009\2\2\0025\4\b\0=\1\t\0045\5\n\0=\5\v\4B\2\2\0019\2\f\0009\2\2\0025\4\r\0=\1\t\0045\5\17\0005\6\15\0005\a\14\0=\a\16\6=\6\18\5=\5\19\4B\2\2\0015\2\20\0006\3\21\0\18\5\2\0B\3\2\4X\6\5Ä8\b\a\0009\b\2\b5\n\22\0=\1\t\nB\b\2\1E\6\3\3R\6˘\127K\0\1\0\1\0\1\21single_file_mode\2\vipairs\1\a\0\0\vbashls\trome\ngopls\16sumneko_lua\vclangd\18rust_analyzer\rsettings\vpython\1\0\0\ranalysis\1\0\0\1\0\4\21typeCheckingMode\boff\19diagnosticMode\14workspace\27useLibraryCodeForTypes\2\20autoSearchPaths\2\1\0\0\fpyright\17init_options\1\0\2\15licenceKey7/home/ch4ser/.config/nvim/intelephense_license_key\22globalStoragePath\25/home/ch4ser/.config\17capabilities\1\0\1\21single_file_mode\2\17intelephense\25default_capabilities\17cmp_nvim_lsp\14lspconfig\20mason-lspconfig\nsetup\nmason\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire[\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\19expand_or_jump\23expand_or_jumpableO\0\1\4\1\2\0\14-\1\0\0009\1\0\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\0\0009\1\1\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\3¿\tjump\rjumpableR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_next_item\fvisibleR\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\0¿\21select_prev_item\fvisible£\t\1\0\r\0E\0w6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0026\3\0\0'\5\4\0B\3\2\0024\4\t\0005\5\5\0>\5\1\0045\5\6\0>\5\2\0045\5\a\0>\5\3\0045\5\b\0>\5\4\0045\5\t\0>\5\5\0045\5\n\0>\5\6\0045\5\v\0>\5\a\0045\5\f\0>\5\b\0049\5\r\0005\a\15\0005\b\14\0=\b\16\a5\b\19\0005\t\17\0=\4\18\t=\t\16\b5\t\20\0=\t\21\b=\b\22\a5\b\24\0003\t\23\0=\t\25\b=\b\26\a5\b\29\0009\t\27\0025\v\28\0B\t\2\2=\t\30\b=\b\31\a5\b\"\0009\t \0009\t!\tB\t\1\2=\t#\b9\t \0009\t$\t5\v%\0B\t\2\2=\t&\b9\t \0003\v'\0005\f(\0B\t\3\2=\t)\b9\t \0003\v*\0005\f+\0B\t\3\2=\t,\b9\t \0003\v-\0005\f.\0B\t\3\2=\t/\b9\t \0003\v0\0005\f1\0B\t\3\2=\t2\b=\b \a9\b3\0009\b4\b4\n\5\0005\v5\0>\v\1\n5\v6\0>\v\2\n5\v7\0>\v\3\n5\v8\0>\v\4\nB\b\2\2=\b4\a5\b9\0004\t\n\0009\n:\1>\n\1\t9\n;\1>\n\2\t9\n<\1>\n\3\t9\n=\1>\n\4\t9\n>\1>\n\5\t9\n?\1>\n\6\t9\n@\1>\n\a\t9\nA\1>\n\b\t9\nB\1>\n\t\t=\tC\b=\bD\aB\5\2\0012\0\0ÄK\0\1\0\fsorting\16comparators\norder\vlength\14sort_text\tkind\rlocality\nscore\18recently_used\nexact\voffset\1\0\1\20priority_weight\3\1\1\0\1\tname\nneorg\1\0\1\tname\fluasnip\1\0\1\tname\vbuffer\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<Up>\1\3\0\0\6i\6s\0\v<Down>\1\3\0\0\6i\6s\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-q>\1\0\0\nclose\fmapping\15formatting\vformat\1\0\0\1\0\2\rmaxwidth\0032\tmode\vsymbol\15cmp_format\fsnippet\vexpand\1\0\0\0\vwindow\18documentation\1\0\1\vborder\frounded\1\0\0\vborder\1\0\1\14scrollbar\b‚ïë\15completion\1\0\0\1\0\1\16completeopt\26menu,menuone,noinsert\nsetup\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚îî\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚îò\16FloatBorder\1\3\0\0\b‚îÇ\16FloatBorder\1\3\0\0\b‚îê\16FloatBorder\1\3\0\0\b‚îÄ\16FloatBorder\1\3\0\0\b‚îå\16FloatBorder\fluasnip\flspkind\23cmp.config.compare\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: marks.nvim
time([[Config for marks.nvim]], true)
try_loadstring("\27LJ\2\nô\2\0\0\4\0\n\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0024\3\0\0=\3\6\0025\3\a\0=\3\b\0024\3\0\0=\3\t\2B\0\2\1K\0\1\0\rmappings\15bookmark_0\1\0\3\14virt_text\5\tsign\b‚öë\rannotate\1\23excluded_filetypes\18sign_priority\1\0\4\fbuiltin\3\b\nupper\3\15\nlower\3\n\rbookmark\3\20\1\0\4\21refresh_interval\3˙\1\22force_write_shada\1\vcyclic\2\21default_mappings\1\nsetup\nmarks\frequire\0", "config", "marks.nvim")
time([[Config for marks.nvim]], false)
-- Config for: neorg
time([[Config for neorg]], true)
try_loadstring("\27LJ\2\nà\2\0\0\6\0\15\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\r\0005\3\3\0004\4\0\0=\4\4\0034\4\0\0=\4\5\0034\4\0\0=\4\6\0035\4\b\0005\5\a\0=\5\t\4=\4\n\0034\4\0\0=\4\v\0034\4\0\0=\4\f\3=\3\14\2B\0\2\1K\0\1\0\tload\1\0\0\16core.export\22core.norg.qol.toc\25core.norg.completion\vconfig\1\0\0\1\0\1\vengine\rnvim-cmp\24core.norg.manoeuvre\24core.norg.concealer\18core.defaults\1\0\0\nsetup\nneorg\frequire\0", "config", "neorg")
time([[Config for neorg]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\n\v\0\1\1\0\0\0\1K\0\1\0\v\0\2\2\0\0\0\1K\0\1\0å\5\1\0\t\0$\0B,\0\3\0006\4\0\0009\4\1\4'\6\2\0B\4\2\2\a\4\3\0X\4\5Ä+\0\1\0+\1\1\0'\3\4\0'\2\5\0X\4\15Ä6\4\0\0009\4\1\4'\6\2\0B\4\2\2\a\4\6\0X\4\5Ä+\0\1\0+\1\1\0'\3\4\0'\2\a\0X\4\4Ä+\0\2\0+\1\2\0'\3\b\0'\2\a\0006\4\t\0'\6\n\0B\4\2\0029\4\v\0045\6\f\0=\2\r\6=\0\b\0065\a\15\0005\b\14\0=\b\16\a5\b\17\0=\b\18\a4\b\0\0=\b\19\a4\b\0\0=\b\20\a=\3\21\a=\a\22\0065\a\23\0=\a\21\6=\1\24\0063\a\25\0=\a\26\0063\a\27\0=\a\28\6B\4\2\0016\4\t\0'\6\29\0B\4\2\0029\4\v\0045\6\31\0005\a\30\0=\a \6B\4\2\0016\4!\0009\4\"\4'\6#\0B\4\2\1K\0\1\0\27colorscheme tokyonight\bcmd\bvim\foptions\1\0\0\1\0\1\ntheme\15tokyonight\flualine\18on_highlights\0\14on_colors\0\17dim_inactive\1\3\0\0\aqf\thelp\vstyles\rsidebars\14variables\14functions\rkeywords\1\0\1\vitalic\2\rcomments\1\0\1\vfloats\tdark\1\0\1\vitalic\2\nstyle\1\0\4\29hide_inactive_statusline\1\19day_brightness\4ö≥ÊÃ\tô≥Ê˝\3\17lualine_bold\2\20terminal_colors\2\nsetup\15tokyonight\frequire\16transparent\nstorm\0062\nnight\tdark\0061\rNVIM_GUI\vgetenv\aos\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n3\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\20NvimTreeRefresh\bcmd\bvimÎ\1\0\0\a\1\15\0\0256\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0029\2\3\1\a\2\4\0X\2\nÄ6\2\5\0009\2\6\0029\2\a\2'\4\b\0009\5\t\1'\6\n\0&\4\6\0045\5\v\0B\2\3\1X\2\6Ä-\2\0\0009\2\f\0029\2\r\0029\2\14\2\18\4\1\0B\2\2\1K\0\1\0\0¿\tedit\topen\tnode\1\0\1\vdetach\2\b' &\18absolute_path\15xdg-open '\rjobstart\afn\bvim\bpdf\14extension\23get_node_at_cursor\18nvim-tree.lib\frequireä\a\1\0\n\0\"\0/6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0013\3\4\0B\1\2\0013\1\5\0006\2\0\0'\4\6\0B\2\2\0029\2\a\0025\4\b\0004\5\0\0=\5\t\0045\5\n\0=\5\v\0045\5\f\0005\6\r\0=\6\14\5=\5\15\0045\5\16\0005\6\21\0004\a\3\0005\b\18\0005\t\17\0=\t\19\b=\1\20\b>\b\1\a=\a\22\6=\6\23\5=\5\24\0045\5\26\0005\6\25\0=\6\27\5=\5\28\0045\5\29\0004\6\0\0=\6\30\5=\5\31\0045\5 \0=\5!\4B\2\2\0012\0\0ÄK\0\1\0\rrenderer\1\0\1\27highlight_opened_files\ball\24update_focused_file\16ignore_list\1\0\2\venable\2\15update_cwd\1\ffilters\vcustom\1\0\0\1\2\0\0\b^\\.\tview\rmappings\tlist\1\0\0\14action_cb\bkey\1\0\1\vaction\20nvimtreexdgopen\1\4\0\0\t<CR>\6o\18<2-LeftMouse>\1\0\a\vnumber\1\19relativenumber\1 preserve_window_proportions\2\15signcolumn\byes\tside\tleft\21hide_root_folder\1\nwidth\3\20\16diagnostics\nicons\1\0\4\fwarning\bÔÅ±\tinfo\bÔÅö\nerror\bÔÅó\thint\bÔÅ™\1\0\1\venable\2\23hijack_directories\1\0\2\venable\2\14auto_open\2\23ignore_ft_on_setup\1\0\n\18hijack_cursor\2'hijack_unnamed_buffer_when_opening\1\23sync_root_with_cwd\2\15update_cwd\2\16open_on_tab\2\25auto_reload_on_write\2\27ignore_buffer_on_setup\1\18open_on_setup\1\17hijack_netrw\2\18disable_netrw\2\nsetup\14nvim-tree\0\0\23on_nvim_tree_ready\21nvim-tree.events\18nvim-tree.api\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nd\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\tkeys\28etovxqpdygfblzhckisuran\18extend_visual\2\nsetup\bhop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: null-ls.nvim
time([[Config for null-ls.nvim]], true)
try_loadstring("\27LJ\2\nû\2\0\0\r\0\18\0\"6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\16\0004\4\4\0009\5\3\0009\5\4\0059\5\5\0059\5\6\0055\a\f\0004\b\3\0'\t\a\0006\n\b\0009\n\t\n9\n\n\n'\f\v\0B\n\2\2&\t\n\t>\t\1\b=\b\r\aB\5\2\2>\5\1\0049\5\3\0009\5\4\0059\5\14\5>\5\2\0049\5\3\0009\5\4\0059\5\15\5>\5\3\4=\4\17\3B\1\2\1K\0\1\0\fsources\1\0\0\17markdown_toc\nblack\15extra_args\1\0\0\21{IndentWidth: 4}\vexpand\afn\bvim\f-style=\twith\17clang_format\15formatting\rbuiltins\nsetup\fnull-ls\frequire\0", "config", "null-ls.nvim")
time([[Config for null-ls.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nw\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\25show_current_context\2\31show_current_context_start\2\nsetup\21indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Conditional loads
time([[Conditional loading of telescope-fzf-native.nvim]], true)
  require("packer.load")({"telescope-fzf-native.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of telescope-fzf-native.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
vim.cmd [[ packadd bufferline.nvim ]]

-- Config for: bufferline.nvim
try_loadstring("\27LJ\2\ng\0\1\5\0\a\0\0149\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\15\0\1\0X\2\6Ä6\1\3\0009\1\4\0019\1\5\0019\3\0\0'\4\6\0D\1\3\0K\0\1\0\t:t:r\16fnamemodify\afn\bvim\t%.md\nmatch\tname\31\0\4\a\0\2\0\5'\4\0\0\18\5\0\0'\6\1\0&\4\6\4L\4\2\0\6)\6(Ó\1\0\1\4\0\n\0 6\1\0\0009\1\1\0018\1\0\0019\1\2\1\6\1\3\0X\1\2Ä+\1\2\0L\1\2\0006\1\0\0009\1\4\0019\1\5\1\18\3\0\0B\1\2\2\6\1\6\0X\1\2Ä+\1\2\0L\1\2\0006\1\0\0009\1\4\0019\1\a\1B\1\1\2\a\1\b\0X\1\bÄ6\1\0\0009\1\1\0018\1\0\0019\1\2\1\6\1\t\0X\1\2Ä+\1\2\0L\1\2\0K\0\1\0\twiki\16<work-repo>\vgetcwd\30<buffer-name-I-dont-want>\fbufname\afn\30<i-dont-want-to-see-this>\rfiletype\abo\bvimÃ\4\1\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\3\0005\4\4\0=\4\5\0033\4\6\0=\4\a\0033\4\b\0=\4\t\0033\4\n\0=\4\v\3=\3\r\2B\0\2\1K\0\1\0\foptions\1\0\0\18custom_filter\0\26diagnostics_indicator\0\19name_formatter\0\14indicator\1\0\2\nstyle\14underline\ticon\6>\1\0\19\18close_command\15Bdelete %d\22buffer_close_icon\bÔÄç\28show_buffer_close_icons\2\20show_close_icon\1\23left_mouse_command\14buffer %d\24persist_buffer_sort\2\27always_show_bufferline\2\16diagnostics\rnvim_lsp\rtab_size\3\18\22max_prefix_length\3\15\20max_name_length\3\18\fsort_by\aid\25enforce_regular_tabs\2\23right_trunc_marker\bÔÇ©\24show_tab_indicators\2\22left_trunc_marker\bÔÇ®\15close_icon\bÔÄç\22show_buffer_icons\2\18modified_icon\b‚óè\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
