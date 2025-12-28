local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local fb_actions = require "telescope".extensions.file_browser.actions
telescope.load_extension "media_files"

telescope.setup {
  defaults = {
		layout_config = {
			height =  0.99,
			width  =  0.99,
			horizontal = { preview_width = 0.7 }
		},

	border = {
    prompt = { 1, 1, 1, 1 },
    results = { 1, 1, 1, 1 },
    preview = { 1, 1, 1, 1 },
  },
  borderchars = {
    prompt = { " ", " ", "─", "│", "│", " ", "─", "└" },
    results = { "─", " ", " ", "│", "┌", "─", " ", "│" },
    preview = { "─", "│", "─", "│", "┬", "┐", "┘", "┴" },
  },

    prompt_prefix = "  ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,

        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
        ["<C-l>"] = actions.complete_tag,
        ["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
        ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

        ["j"] = actions.move_selection_next,
        ["k"] = actions.move_selection_previous,
        ["H"] = actions.move_to_top,
        ["M"] = actions.move_to_middle,
        ["L"] = actions.move_to_bottom,

        ["<Down>"] = actions.move_selection_next,
        ["<Up>"] = actions.move_selection_previous,
        ["gg"] = actions.move_to_top,
        ["G"] = actions.move_to_bottom,

        ["<C-u>"] = actions.preview_scrolling_up,
        ["<C-d>"] = actions.preview_scrolling_down,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,

        ["?"] = actions.which_key,
      },
    },
  },
  pickers = {
  },
  extensions = {
    media_files = {
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
    file_browser = {
			hidden = true,
      mappings = {
        ["i"] = {
					["<space>a"] = fb_actions.create,
					["<space>r"] = fb_actions.rename,
					["<space>m"] = fb_actions.move,
					["<space>y"] = fb_actions.copy,
					["<space>d"] = fb_actions.remove,
					["<space>o"] = fb_actions.open,
					["<space>g"] = fb_actions.goto_parent_dir,
					["<space>e"] = fb_actions.goto_home_dir,
					["<space>w"] = fb_actions.goto_cwd,
					["<space>h"] = fb_actions.toggle_hidden,
					["<space>f"] = fb_actions.toggle_browser
        },
        ["n"] = {
        	["<space>a"] = fb_actions.create,
					["<space>r"] = fb_actions.rename,
					["<space>m"] = fb_actions.move,
					["<space>y"] = fb_actions.copy,
					["<space>d"] = fb_actions.remove,
					["<space>o"] = fb_actions.open,
					["<space>g"] = fb_actions.goto_parent_dir,
					["<space>e"] = fb_actions.goto_home_dir,
					["<space>w"] = fb_actions.goto_cwd,
					["<space>h"] = fb_actions.toggle_hidden,
					["<space>f"] = fb_actions.toggle_browser

        },
      },
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        previewer = false,
      },
    },
  },
}

require("telescope").load_extension "ui-select"
require("telescope").load_extension "file_browser"
require("telescope").load_extension("recent_files")
require('telescope').load_extension('media_files')
