return {

--nvim theme
{'shaunsingh/nord.nvim',
		config = function ()
			vim.cmd[[colorscheme nord]]
	end
},
--nvim config
{  "folke/which-key.nvim",  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end, },
  {
    "nvim-neorg/neorg",
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {},
      },
    },
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
},
{  "hrsh7th/nvim-cmp", event = "InsertEnter",  dependencies = {   "hrsh7th/cmp-nvim-lsp",   "hrsh7th/cmp-buffer",  }, },
{ "L3MON4D3/LuaSnip",	build = "make install_jsregexp" },
{ "rafamadriz/friendly-snippets" },

{  'windwp/nvim-autopairs',  event = "InsertEnter",config = true  },
    'brenoprata10/nvim-highlight-colors',

 --nvim treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
    end
  },
  {  "JoosepAlviste/nvim-ts-context-commentstring", event = "BufRead",},
  "mrjones2014/nvim-ts-rainbow",
  { "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup{
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        default = { 'class', 'function', 'method'  } } }
    end },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "stevearc/dressing.nvim", event = "VeryLazy" },
  {  "Wansmer/treesj",
    keys = {   { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },  },
    opts = { use_default_keymaps = false, max_join_length = 150 },  },
  {  "monaqa/dial.nvim",  keys = { "<C-a>", { "<C-x>", mode = "n" } },  },

--bufferline
 {'akinsho/bufferline.nvim', dependencies = 'nvim-tree/nvim-web-devicons'},
 {'romgrk/barbar.nvim', dependencies = { 'lewis6991/gitsigns.nvim',  'nvim-tree/nvim-web-devicons',  },
   init = function() vim.g.barbar_auto_setup = false end,  },
--nvim statusbar
  "nvim-lualine/lualine.nvim",
	'arkav/lualine-lsp-progress',
--noice
  {  "folke/noice.nvim",
     event = "VeryLazy",
     dependencies = {  "MunifTanjim/nui.nvim",
              {    "rcarriga/nvim-notify",
			              config = function()
                       require('notify').setup ({
                          background_colour = "#000000"
                       })
                    end}
	}},
--nvim ashboard
  {"goolord/alpha-nvim"},
  { 'b0o/incline.nvim',  event = 'VeryLazy',},
--nvim filebrowser
{
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader>-",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  ---@type YaziConfig
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
   },
	{ "nvim-tree/nvim-tree.lua",
       lazy = false,
       dependencies = {
         "nvim-tree/nvim-web-devicons",
       },
       config = function()
         require("nvim-tree").setup {}
       end,
  },
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    config = function()
        require'window-picker'.setup({
				  filter_rules = {
					  include_current_win = false,
					  autoselect_one      = true,
					  bo = {
						   filetype = {'neo-tree','neo-tree-popup','notify'},
						   buftype  = {'terminal','quickfix'},
					  }
				  }
			  })
    end, },
--nvimlspconfig
  {
  "folke/lsp-colors.nvim",
  event = "BufRead",
  },
  {
  "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions
          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
          })
  end,
  },
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "saadparwaiz1/cmp_luasnip",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "neovim/nvim-lspconfig",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "RRethy/vim-illuminate",
  'mfussenegger/nvim-dap',
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  "nvim-lua/plenary.nvim",
  "nvimtools/none-ls.nvim",

  --telescope
  { 'nvim-telescope/telescope.nvim',
     dependencies = { 'nvim-lua/plenary.nvim' ,    'mollerhoj/telescope-recent-files.nvim',}  },
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	{
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {'prochri/telescope-all-recent.nvim',
  dependencies = {
  "nvim-telescope/telescope.nvim",
  "kkharji/sqlite.lua",
  "stevearc/dressing.nvim"  } },
  'nvim-telescope/telescope-ui-select.nvim',
  'nvim-lua/popup.nvim',
  'nvim-telescope/telescope-media-files.nvim',
  "smartpde/telescope-recent-files",
  {"iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
   },
 {
   "3rd/image.nvim",
   build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
   opts = {
       processor = "magick_cli",
   }
 },
	--lazygit
  { "kdheepak/lazygit.nvim",cmd = {
	"LazyGit",
	"LazyGitConfig",
	"LazyGitCurrentFile",
	"LazyGitFilter",
	"LazyGitFilterCurrentFile",},
    dependencies = {   "nvim-lua/plenary.nvim",  },
    keys = {  { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } }
  },
  { "hedyhli/outline.nvim",
    config = function()
    vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
      { desc = "Toggle Outline" })

    require("outline").setup {
    }
  end,
  },
	"sindrets/diffview.nvim",
	{  "soulis-1256/eagle.nvim",
		config = function ()
			require("eagle").setup({
				border = "single",
				border_color = "#5e81ac",
        close_on_cmd = true,
				debug_mode = false,
				detect_idle_timer = 50,
				max_height_factor = 2.5,
				max_width_factor  = 2,
				render_delay = 500,
				scrollbar_offset = 0,
				show_lsp_info = true,
				title = "  ",
				title_color = "#bf616a",
				title_pos   = "center",
				window_col = 5,
				window_row = 0,
			})
		end
  },
	{
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
},
 {
	"supermaven-inc/supermaven-nvim",
    config = function()
      require("supermaven-nvim").setup({
   		  keymaps = {
          accept_suggestion = "<Tab>",
          clear_suggestion = "<C-]>",
          },
        ignore_filetypes = { cpp = true },
        color = {
          suggestion_color = "#ffffff",
          cterm = 244,}
   	  })
    end,
  },
	{
  'gorbit99/codewindow.nvim',
  config = function()
    local codewindow = require('codewindow')
    codewindow.setup({
			active_in_terminals = false,
      auto_enable = true,
      exclude_filetypes = { 'help' },
      max_minimap_height = nil,
      max_lines = nil,
      minimap_width = 20,
      use_lsp = true,
      use_treesitter = true,
      use_git = true,
      width_multiplier = 4,
      z_index = 1,
      show_cursor = true,
      screen_bounds = 'background',
      window_border = 'none',
      relative = 'win',
			vents = { 'TextChanged', 'InsertLeave', 'DiagnosticChanged', 'FileWritePost' } 
			})
    codewindow.apply_default_keybinds()
  end,
  },
	'echasnovski/mini.nvim',
	{ 'nvim-lua/plenary.nvim' },
	-- lazy.nvim
{
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    image = { enabled = true },
  },
},
{"SmiteshP/nvim-navic"}
}
