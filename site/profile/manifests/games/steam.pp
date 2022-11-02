#
class profile::games::steam {

  # https://steamcdn-a.akamaihd.net/client/installer/steam.deb

  # https://github.com/ValveSoftware/steam-for-linux/issues/5884#issuecomment-437690163

  include apt

  ############################
  #
  # Simplified STEAM install now, just need to add i386
  #
  ###############################
  exec { 'i386':
    command => '/usr/bin/dpkg --add-architecture i386',
    onlyif  => 'test ! `cat /var/lib/dpkg/arch | grep i386`'
  }

  package { 'steam' :
    ensure  => latest,
    require => [ Exec['i386'], Class['apt::update'], ]
  }


  ##############################
  #
  # Pre-install requirements for steam
  #
  #################################
  # exec { 'i386':
  #   command => '/usr/bin/dpkg --add-architecture i386',
  #   # unless  => '/bin/grep -q i386 /var/lib/dpkg/arch',
  # }

  # package { ['steam-libs-i386:i386', 'libc6:i386', 'libegl1:i386', 'libgbm1:i386', 'libgl1-mesa-dri:i386', 'libgl1:i386', 'libnvidia-gl-470:i386']:
  #   ensure  => latest,
  #   require => [Class['apt::update'], Exec['i386'], ]
  # }

  # package { ['libc6:amd64', 'libgl1-mesa-dri:amd64', 'libgl1:amd64', 'libgbm1:amd64', 'steam-libs-amd64:amd64']:
  #   ensure  => latest,
  #   # require => [Class['apt::update'], Package['steam'], ]
  # }


  ##############################
  #
  # Steam deb installation
  #
  #################################

  # include gdebi

  # archive { '/tmp/steam.deb':
  #   ensure => present,
  #   source => 'https://steamcdn-a.akamaihd.net/client/installer/steam.deb',
  # }

  # package { 'steam':
  #     ensure    => latest,
  #     provider  => gdebi,
  #     source    => '/tmp/steam.deb',
  #     subscribe => Archive['/tmp/discord.deb'],
  #     require   => [Class['apt::update'], Exec['i386'], ]
  # }


  # package { 'steam':
  #   ensure  => latest,
  #   require => [Class['apt::update'], Exec['i386'], ]
  # }

  ##############################
  #
  # Steam post-install stuff
  #
  #################################

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
rm -rf "/home/$USER/.local/share/Steam/steamapps" # removes steam directory in home drive
mkdir -p "/shared/$USER/steamapps" # makes user > steamapps in shared directory under user
ln -sf "/shared/$USER/steamapps" "/home/$USER/.local/share/Steam" # links the shared folder to user local home

'

  file_line { 'steamapps':
    path      => '/usr/bin/steam',
    match     => 'CUSTOM VIA PUPPET',
    replace   => false,
    after     => '^cd "\$LAUNCHSTEAMDIR"$', # regex
    line      => $custom_command,
    subscribe => Package['steam'],
  }

  # fix error in rm line on first install...
  # file_line { 'steamapps-fix1':
  #   path  => '/usr/bin/steam',
  #   match => '^rm -r "\/home\/\$USER\/\.local\/share\/Steam\/steamapps',
  #   line  => 'rm -rf "/home/$USER/.local/share/Steam/steamapps" # removes steam directory in home drive'
  # }

}
