require("full-border"):setup{
	type = ui.Border.PLAIN,
}
require("restore"):setup({
    position = { "top-right", w = 40, h = 20 }, -- Optional
    show_confirm = true,  -- Optional
    suppress_success_notification = true,  -- Optional
    theme = { -- Optional
      title = "blue", -- Optional. This value has higher priority than flavor/theme.lua
      header = "green", -- Optional. This value has higher priority than flavor/theme.lua
      header_warning = "yellow", -- Optional
      list_item = { odd = "blue", even = "blue" }, -- Optional. This value has higher priority than flavor/theme.lua
    },
})
