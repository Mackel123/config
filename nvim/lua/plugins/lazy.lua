local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(
	"plugins.plugins",
	{
		defaults = {
		  lazy = false,
      version = nil
	  },
    git = {
			log = { "-8" },
			timeout = 120,
			url_format = "https://github.com/%s.git",
			filter = true
		},
		install = {
			missing = true,
		},
		ui = {
			size = {width = 0.9,height = 0.9},
			wrap = true,
			border = "solid",
			backrop = 60,
			title = nil,
			title_pos = "center",
			pills = true,
			icons = {
        cmd = " ",
        config = "",
        event = " ",
        ft = " ",
        init = " ",
        import = " ",
        keys = " ",
        lazy = "󰒲 ",
        loaded = "●",
        not_loaded = "○",
        plugin = " ",
        runtime = " ",
        require = "󰢱 ",
        source = " ",
        start = " ",
        task = "✔ ",
        list = {
          "●",
          "➜",
          "★",
          "‒",
        },
		  }
	  },
		browser = "qutebrowser",
		duff = {cmd =  "git" },
		checker = {
      enabled = true,
      concurrency = 0.3,
      notify = true,
			frequency = 3600,
      check_pinned = true,
    },
		change_detection = {
			enabled = true,
			notify  = true,
		}
	}
)
