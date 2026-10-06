hl.config(
	{ ecosystem = 
	    { enforce_permissions = true 
		  }
	}
)

local permission = hl.permission

permission(
	 { binary = "/usr/bin/hyprlock", type = "screencopy", mode = "allow"},
   { binary = "/usr/bin/appsuite-.*", type = "screencopy", mode = "allow" }
)
