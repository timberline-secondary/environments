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
    require => File['/etc/dconf/db/gdm.d'],
    notify  => Exec['dconf update']
  }

  # Add Hackerspace logo
  # https://help.gnome.org/admin/system-admin-guide/stable/login-logo.html.en
  $logo = 'Tubuntu-logo.png'
  file { $logo:
    ensure => file,
    path   => "/usr/share/pixmaps/${logo}",
    source => "puppet:///modules/profile/config/${logo}",
  }

  file { '/etc/dconf/db/gdm.d/01-logo':
    ensure  => file,
    content => "[org/gnome/login-screen]
logo='/usr/share/pixmaps/${logo}'\n",
    require => File['/etc/dconf/db/gdm.d', $logo],
    notify  => Exec['dconf update']
  }

  # Add banner text
  # https://help.gnome.org/admin/system-admin-guide/stable/login-banner.html.en
  file { '/etc/dconf/db/gdm.d/01-banner-message':
    ensure  => file,
    content => '[org/gnome/login-screen]
banner-message-enable=true
banner-message-text="Welcome to the Hackerspace! \n\nGuests can log in with \n\nuser: guest\npassword: guest"
',
    require => File['/etc/dconf/db/gdm.d'],
    notify  => Exec['dconf update']
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
