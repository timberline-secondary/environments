#
class profile::config::gnome {

# https://help.gnome.org/admin/system-admin-guide/stable/login-userlist-disable.html.en

  file { '/etc/profile/gdm':
    ensure  => file,
    content => "user-db:user
system-db:gdm
file-db:/usr/share/gdm/greeter-dconf-defaults",
  }

  file { '/etc/dconf/db/gdm.d':
    ensure => directory,
  }

  file { ' /etc/dconf/db/gdm.d/00-login-screen':
    ensure  => file,
    content => "[org/gnome/login-screen]
# Do not show the user list
disable-user-list=true",
    require => [File['/etc/dconf/db/gdm.d']]
  }

  # gnome::gsettings { 'DisableUserList':
  #   schema => 'org.gnome.login-screen.disable-user-list',
  #   key    => 'disable-user-list',
  #   value  => 'true',
  # }


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
