#
class profile::games::steam {

  # https://steamcdn-a.akamaihd.net/client/installer/steam.deb

  # https://github.com/ValveSoftware/steam-for-linux/issues/5884#issuecomment-437690163

  include apt

  exec { 'i386':
    command => '/usr/bin/dpkg --add-architecture i386',
    # unless  => '/bin/grep -q i386 /var/lib/dpkg/arch',
  }
  package { 'libnvidia-gl-440:i386':
    ensure  => latest,
    require => [Class['apt::update'], Exec['i386'], ]
  }

  package { 'libgl1-mesa-glx:i386':
    ensure  => latest,
    require => [Class['apt::update'], Exec['i386'], ]
  }

  package { 'steam':
    ensure  => latest,
    require => [Class['apt::update'], Exec['i386'], ]
  }

  # Remove the update notifier to prevent pop-up on all users.
  file { 'steam-update-notifier':
    ensure    => absent,
    path      => '/var/lib/update-notifier/user.d/steam-install-notify',
    subscribe => Package['steam'],
  }

  # symlink the user's steamapps directory to local filesystem so games aren't played over the network
  # place this in the steam launch script at /usr/bin/steam right before the script exec's the launcher
  $custom_command = '
# CUSTOM VIA PUPPET - link steamapps (game install) dir to local /shared/ directory
rm -r "/home/$USER/.local/share/Steam/steamapps" # removes steam directory in home drive
mkdir -p "/shared/$USER/steamapps" # makes user > steamapps in shared directory under user
ln -sf "/shared/$USER/steamapps" "/home/$USER/.local/share/Steam" # links the shared folder to user local home

'

  file_line { 'steamapps':
    path      => '/usr/games/steam',
    match     => 'CUSTOM VIA PUPPET',
    replace   => false,
    after     => '# launch the Valve run script',
    line      => $custom_command,
    subscribe => Package['steam'],
  }

}
