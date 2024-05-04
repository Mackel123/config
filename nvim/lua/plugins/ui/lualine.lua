-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

-- stylua: ignore
local colors = {
  blue   = '#5e81ac',
  cyan   = '#88c0d0',
  black  = '#2e3440',
  white  = '#d8dee9',
  red    = '#bf616a',
  violet = '#b48ead',
  grey   = '#4c566a',
	oranger = '#D08770',
	yellow = '#E8CB88',
	green = '#A3BE8C',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.oranger },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white, bg = colors.black},
		x = { fg = colors.blue, bg = colors.black }
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode','buffers', separator = { left = '' }, right_padding = 0 } },
    lualine_b = {
			'filename',
			'branch',
			{'diff',
      colored = true,
      diff_color = {
        added    = {fg = colors.cyan, bg = colors.grey},
        modified = {fg = colors.cyan, bg = colors.grey},
        removed  = {fg = colors.cyan, bg = colors.grey}
				},
      symbols = {added = '+', modified = '~', removed = '-'},
			source = nil, }
		},
    lualine_c = {
      '%=',
      'lsp_progress',
      {'diagnostics',
       sources = { 'nvim_diagnostic' },
       sections = { 'error', 'warn', 'info', 'hint' },
       symbols = {error = ' ', warn = ' ', info = ' ', hint = '󰔊 '},
       diagnostics_color = {
      	color_error = { fg = colors.red },
      	color_warn = { fg = colors.yellow},
      	color_info = { fg = colors.oranger },
      	color_hint = { fg = colors.violet },
      },}

    },
    lualine_x = {
			{'datetime','windows',separator = { left = '' }, right_padding = 2}
		},
    lualine_y = {
			'os.date',
			'filetype',
			'progress',
			{'fileformat',  symbols = {  unix = '',  dos = '',  mac = '', }}
		},
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {
   		   },
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}
