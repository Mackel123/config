--general
hl.env("GDK_SCALE", "1")
--cursor theme
hl.env("XCURSOR_THEME", "Layan-cursors")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "Layan-cursors")
hl.env("HYPRCURSOR_SIZE", "24")
--input method
hl.env("QT_IM_MODULE", "fcitx")
hl.env("XMODIFIERS", "@im=fcitx")
hl.env("SDL_IM_MODULE", "fcitx")
hl.env("GLFW_IM_MODULE", "ibus")
hl.env("INPUT_METHOD", "fcitx")
--qt theme
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
--xdg environment
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
--screenshot dir
hl.env("HYPRSHOT_DIR", "/home/mackelguo/Pictures/Screenshots/")

hl.env("GDK_BACKEND", "wayland,x11,*")
