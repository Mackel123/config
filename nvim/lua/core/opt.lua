local opt = vim.opt
local g = vim.g

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

require('nord').set()

