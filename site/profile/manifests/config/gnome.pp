#
class profile::config::gnome {

  gnome::gsettings { 'DisableUserList':
    schema => 'org.gnome.login-screen.disable-user-list',
    key    => 'disable-user-list',
    value  => 'true',
  }


  # # Recovery some <Ctrl><Alt> shortcuts so they can be used in Blender etc.
  # # Alt + Mouse
  # gnome::gsettings { "AltMouse":
  #   schema => "org.gnome.desktop.wm.preferences",
  #   key    => "mouse-button-modifier",
  #   value  => "'<Super>'",
  # }

  # # Control + Alt + 0 (Blender camera to view)
  # gnome::gsettings { "CtrlAltNum0":
  #   schema => "org.gnome.desktop.wm.keybindings",
  #   key    => "minimize",
  #   value  => "['disabled']",
  # }

  # # Control + Alt + s (Blender scaling bones)
  # gnome::gsettings { "CtrlAltS":
  #   schema => "org.gnome.desktop.wm.keybindings",
  #   key    => "toggle-shaded",
  #   value  => "['disabled']",
  # }

}
