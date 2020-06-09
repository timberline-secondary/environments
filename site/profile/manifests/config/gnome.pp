#
class profile::config::gnome {

  file { '/etc/dconf/profile/gdm':
    ensure  => file,
    content => "user-db:user
system-db:gdm
file-db:/usr/share/gdm/greeter-dconf-defaults
"
  }

  file { '/etc/dconf/db/gdm.d':
    ensure => directory,
  }


  # Disable user list at login screen
  # https://help.gnome.org/admin/system-admin-guide/stable/login-userlist-disable.html.en

  file { '/etc/dconf/db/gdm.d/00-login-screen':
    ensure  => file,
    content => "[org/gnome/login-screen]
disable-user-list=true
",
    require => [File['/etc/dconf/db/gdm.d']],
    notify  => [Exec['dconf update']]
  }

  # Add Hackerspace logo
  # https://help.gnome.org/admin/system-admin-guide/stable/login-logo.html.en
  file { 'Tubuntu-logo.png':
    ensure => file,
    path   => '/usr/share/pixmaps/Tubuntu-logo.png',
    source => 'puppet:///modules/profile/config/Tubuntu-logo.png',
  }

  file { '/etc/dconf/db/gdm.d/01-logo':
    ensure  => file,
    content => "[org/gnome/login-screen]
logo='/usr/share/pixmaps/h10-logo.png'\n",
    require => [File['/etc/dconf/db/gdm.d', 'Tubuntu-logo.png']],
    notify  => [Exec['dconf update']]
  }


  # Update dconf after any changes

  exec {'dconf update':
    path        => '/usr/bin/',
    refreshonly => true,
  }


# Dark theme by default
  gnome::gsettings { 'DarkTheme':
    schema => 'org.gnome.desktop.interface',
    key    => 'gtk-theme',
    value  => 'Yaru-dark',
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
