-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.

local colors = {
  base01 = '#c1c1ff',
  base02 = '#404178',
  base03 = '#131318',
  base04 = '#e4e1e9',
  base05 = '#e9b9d3',
  base06 = '#c6c4dd',
  base07 = '#2a292f',
	base08 = '#404178',
	base09 = '#454559',
	base00 = '#c6c4dd',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.base03, bg = colors.base08 },
    b = { fg = colors.base04, bg = colors.base07 },
    c = { fg = colors.base04, bg = colors.base03},
		x = { fg = colors.base01, bg = colors.base03 }
  },

  insert = { a = { fg = colors.base03, bg = colors.base01 } },
  visual = { a = { fg = colors.base03, bg = colors.base02 } },
  replace = { a = { fg = colors.base03, bg = colors.base05 } },

  inactive = {
    a = { fg = colors.base04, bg = colors.base03 },
    b = { fg = colors.base04, bg = colors.base03 },
    c = { fg = colors.base04 },
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
      colobase05 = true,
      diff_color = {
        added    = {fg = colors.base02, bg = colors.base07},
        modified = {fg = colors.base02, bg = colors.base07},
        removed  = {fg = colors.base02, bg = colors.base07}
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
      	color_error = { fg = colors.base05 },
      	color_warn = { fg = colors.base09},
      	color_info = { fg = colors.base08 },
      	color_hint = { fg = colors.base06 },
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
