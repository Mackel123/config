return {

--nvim theme
{'shaunsingh/nord.nvim',

  config = function()
  vim.cmd[[colorscheme nord]]
  end},
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
  { dir = "~/projects/secret.nvim" },

--bufferline
 {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
 {'romgrk/barbar.nvim', dependencies = { 'lewis6991/gitsigns.nvim',  'nvim-tree/nvim-web-devicons',  },
   init = function() vim.g.barbar_auto_setup = false end,  },
--nvim statusbar
  "nvim-lualine/lualine.nvim",
	'arkav/lualine-lsp-progress',
--dashboard
  {
    'goolord/alpha-nvim',
    config = function ()
        require'alpha'.setup(require'alpha.themes.dashboard'.config)
    end
  },
--noice
  {  "folke/noice.nvim",
     event = "VeryLazy",
     dependencies = {  "MunifTanjim/nui.nvim", "rcarriga/nvim-notify",  }},
--nvim floating term
	{'akinsho/toggleterm.nvim', version = "*", config = true},
  {  "utilyre/barbecue.nvim", name = "barbecue",  version = "*",  dependencies = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons",   },},
  { 'b0o/incline.nvim',  event = 'VeryLazy',},
--nvim filebrowser
  { "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    config = function()
      vim.g.rnvimr_draw_border = 1
      vim.g.rnvimr_pick_enable = 1
      vim.g.rnvimr_bw_enable = 1
    end,  },
	{ "nvim-neo-tree/neo-tree.nvim", branch = "v3.x",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons",  "MunifTanjim/nui.nvim",  "3rd/image.nvim", } } ,
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
  "jose-elias-alvarez/null-ls.nvim",
  "RRethy/vim-illuminate",
  'mfussenegger/nvim-dap',
  { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
  "nvim-lua/plenary.nvim",

  --telescope
  { 'nvim-telescope/telescope.nvim', tag = '0.1.6',
     dependencies = { 'nvim-lua/plenary.nvim' ,    'mollerhoj/telescope-recent-files.nvim',}  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
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
	{
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
   },
	{ "kdheepak/lazygit.nvim",cmd = {
    		"LazyGit",
    		"LazyGitConfig",
    		"LazyGitCurrentFile",
    		"LazyGitFilter",
    		"LazyGitFilterCurrentFile",
    	},
        dependencies = {   "nvim-lua/plenary.nvim",  },
        keys = {  { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" } }
	},
	{
  "hedyhli/outline.nvim",
  config = function()
    -- Example mapping to toggle outline
    vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
      { desc = "Toggle Outline" })

    require("outline").setup {
      -- Your setup opts here (leave empty to use defaults)
    }
  end,
  },
}
