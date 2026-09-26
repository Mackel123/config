--------------
-- monitors---
--------------
hl.monitor(
	{
		output = "",
    mode="preferred",
		scale="1.07",
	}
)
---------------
--my programs--
---------------
local terminal = "kitty"
local fileManager = "pcmanfm-qt"
local browser = "firefox"
local menu = "~/.config/rofi/bin/launcher.sh"
-----------
--general--
-----------
hl.config(
	{
		general = {
			--gaps
			allow_tearing  = true,
			border_size    = 2,
			float_gaps     = 1,
			gaps_in        = 10,
			gaps_out       = 20,
				col = {
					active_border         = { colors= { "#bf616a" , "#50e8ac" }, angle= 135 },
					inactive_border       = "#3b4252",
					nogroup_border        = "#8fbcbb",
					nogroup_border_active = "#4c566a",
			  },
			--layout
			layout         = "dwindle",
			--locale
			locale         = "en_US.UTF-8",
			--snap windows
			snap = {
				enabled              = true,
				border_overlap       = true,
				respect_gaps         = true,
			}
		},
	decoration = {
		--opacity
		active_opacity             = 0.9,
		border_part_of_window      = true,
		dim_around                 = 0.2,
		dim_inactive               = true,
		dim_modal                  = true,
		dim_special                = 0.2,
		dim_strength               = 0.1,
		inactive_opacity           = 0.9,
		rounding                   = 5,
		rounding_power             = 2,
		--blur
		blur = {
			enabled                   = true,
			ignore_opacity            = true,
			input_methods             = true,
			input_methods_ignorealpha = true,
			new_optimizations         = true,
			noise                     = 0.3,
			passes                    = 3,
			popups                    = true,
			popups_ignorealpha        = 0.3,
			size                      = 7,
			special                   = true,
		  },
  	shadow = {
  	  enabled                   = true,
  		color                     = "#000000",
  		offset                    = {0,0},
  		range                     = 5,
  		render_power              = 2,
  		scale                     = 0.5,
  		sharp                     = true,
  	  },
		glow = {
			enabled                   =true,
			color                     = "#5e81ac",
			range                     = 5,
			render_power              = 2,
		  },
		motion_blur = {
			enabled                   = true,
			samples                   = 5,
		  },
 		wobble = {
 		  enabled                   = true,
 		  mesh                      =5,
 		  stiffness                 =200,
 		  mass                      =2,
      intensity                 =0.1,
 		},
  	},
	input = {
		accel_profile                 = "flat",
		emulate_discrete_scroll       = 1,
		float_switch_override_focus   =2,
		focus_on_close                = 1,
		follow_mouse                  = 1,
		follow_mouse_shrink           = 150,
		kb_layout                     = "us",
	},
	group = {
		auto_group                    = true,
		drag_into_group               = 1,
		focus_removed_window          = true,
		group_on_movetoworkspace      = true,
		merge_groups_on_drag          = true,
		merge_groups_on_groupbar      = true,
		col = {
			border_active             = "#d08770",
			border_inactive           = "#a3be8c",
			border_locked_active      = "#bf616a",
			border_locked_inactive    = "#8fbcbb",
		},
		groupbar = {
			enabled                   = true,
			blur                      = true,
			disable_when_only         = false,
			font_family               = "JetBrains Mono",
			font_size                 = 12,
			font_weight_active        = "Medium",
			font_weight_inactive      = "Light",
			gradients                  = true,
			gradient_rounding         = 2,
			gradient_rounding_power   = 2.0,
			height                    = 12,
			rounding                  = 2,
			col = {
				active                  ="#d08770",
				inactive                ="#a3be8c",
			  locked_active           ="#bf616a",
				locked_inactive         ="#8fbcbb",
			  }
		  }
	  },
	binds = {
		allow_pin_fullscreen         = true,
		allow_workspace_cycles       =true,
		workspace_center_on          =1,
	  },
	xwayland = {
	  enabled                    = true,
		create_abstract_socket     = true,
		force_zero_scaling         = true,
		use_nearest_neighbor       = true,
	},
	cursor = {
		enable_hyprcursor          = true,
		hide_on_key_press          = true,
		hide_on_tablet             = true,
		hide_on_touch              = true,
		hotspot_padding            = 0,
		inactive_timeout           = 2,
		min_refresh_rate           = 24,
		no_break_fs_vrr            = 2,
		sync_gsettings_theme       = true,
		use_cpu_buffer             = 2,
		warp_on_change_workspace   = 0,
		warp_on_monitor_change     = -1,
		warp_on_toggle_special     = 0,
		zoom_detached_camera       = true,
		zoom_disable_aa            = false,
		zoom_factor                = 1,
		zoom_rigid                 = true,
	},
	ecosystem = {
		enforce_permissions        = true,
		no_donation_nag            = false,
		no_update_news             = false,
	}

  }
)



--modules
require("modules.autostart")
require("modules.environment")
require("modules.keybinds")
require("modules.animation")
require("modules.windowrule")
