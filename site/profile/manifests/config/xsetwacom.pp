# configure wacom tablet when user logs in.
class profile::config::xsetwacom {

  file { '/etc/profile.d/configure_wacom.sh':
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => '#!/bin/bash\n
xsetwacom --set "Wacom Intuos5 touch M Pen stylus" MapToOutput 1920x1200+0+0\n
xsetwacom --set "Wacom Intuos5 touch M Pen eraser" MapToOutput 1920x1200+0+0\n
',
  }

}
