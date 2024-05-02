vim.g.barbar_auto_setup = false -- disable auto-setup

require'barbar'.setup {
  animation = true,
  auto_hide = false,
  tabpages = true,
  clickable = true,
  exclude_ft = {'javascript'},
  exclude_name = {'package.json'},
  focus_on_close = 'left',
  hide = {extensions = true, inactive = false},
  highlight_alternate = false,
  highlight_inactive_file_icons = false,
  highlight_visible = true,
  icons = {
    buffer_index = true,
    buffer_number = true,
    button = '',
    diagnostics = {
      [vim.diagnostic.severity.ERROR] = {enabled = true, icon = 'ﬀ'},
      [vim.diagnostic.severity.WARN] = {enabled = true},
      [vim.diagnostic.severity.INFO] = {enabled = true},
      [vim.diagnostic.severity.HINT] = {enabled = true},
    },
    gitsigns = {
      added = {enabled = true, icon = '+'},
      changed = {enabled = true, icon = '~'},
      deleted = {enabled = true, icon = '-'},
    },
    filetype = {
      custom_colors = true,
      enabled = true,
    },
    separator = {left = '▎', right = ''},
    separator_at_end = true,
    -- Supports all the base icon options.
    modified = {button = '●'},
    pinned = {button = '', filename = true},
    preset = 'default',
    alternate = {filetype = {enabled = false}},
    current = {buffer_index = true},
    inactive = {button = '×'},
    visible = {modified = {buffer_number = false}},
  },
  insert_at_end = false,
  insert_at_start = false,
  maximum_padding = 1,
  minimum_padding = 1,
  maximum_length = 30,
  minimum_length = 0,
  semantic_letters = true,
  sidebar_filetypes = {
    NvimTree = true,
    undotree = {
      text = 'undotree',
      align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
    },
    ['neo-tree'] = {event = 'BufWipeout'},
    Outline = {event = 'BufWinLeave', text = 'symbols-outline', align = 'right'},
  },

  letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
  no_name_title = nil,
}
