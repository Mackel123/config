require("toggleterm").setup{
  size = 10,
	open_mapping = [[<space>/]],
  hide_numbers = true,
	shade_filetypes = { },
	autochdir = true,
	highlights = {
		Normal = {
			guibg  = "#2e3440",
		},
		NormalFloat = {
			link = "Normal"
		},
		FloatBorder = {
			guibg  = "#5e81ac",
		}
	},
	shade_terminals = true,
	shading_factor  = 1,
	start_in_insert = true,
	insert_mappings = true,
	direction = "float",
	persist_size = true,
	persist_mode = true,
	float_opts = {
    border = "single",
		width = 120,
		height = 36,
		winlend = 3,
		title_pos = "left",
	},
	wibar = {
		enabled = true,
		    name_formatter = function(term) --  term: Terminal
      return term.name
    end
	}
}
