local opt = vim.opt
local g = vim.g
local o =vim.o

opt.number = true
opt.mouse = "a"
opt.smartcase = true
opt.hlsearch = false
opt.wrap = true
opt.breakindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = false
opt.termguicolors = true
opt.ignorecase = true
opt.wrap = true
g.netrw_banner  = 0
g.netrw_winsize = 30

g.nord_contrast = true
g.nord_borders = false
g.nord_disable_background = false
g.nord_italic = false
g.nord_uniform_diff_background = true
g.nord_bold = true

o.mousemoveevent = true

require('nord').set()

--lazygit
g.lazygit_floating_window_winblend = 1 -- transparency of floating window
g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
g.lazygit_floating_window_border_chars = {'╭','─', '╮', '│', '╯','─', '╰', '│'} -- customize lazygit popup window border characters
g.lazygit_floating_window_use_plenary = 0 -- use plenary.nvim to manage floating window if available
g.lazygit_use_neovim_remote = 1 -- fallback to 0 if neovim-remote is not installed

g.lazygit_use_custom_config_file_path = 0 -- config file path is evaluated if this value is 1
g.lazygit_config_file_path = '' -- custom config file path

