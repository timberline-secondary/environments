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
    path    => '/usr/bin:/usr/sbin:/bin',
    command => '/usr/bin/dpkg --add-architecture i386',
    onlyif  => 'test ! `cat /var/lib/dpkg/arch | grep i386`'
  }

  # needed for league of legends install on Lutris.... the i386 should be its own common manifest.
  package { 'libfreetype6:i386':
    ensure  => latest,
    require => [Exec['i386'], Class['apt::update'], ]
  }

  package { 'steam' :
    ensure  => latest,
    require => [ Exec['i386'], Class['apt::update'], ]
  }


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

## NEW steam install, 
  file_line { 'steamapps':
    path      => '/usr/games/steam',
    match     => 'CUSTOM VIA PUPPET',
    replace   => false,
    after     => '^export DBUS_FATAL_WARNINGS=0$', # regex line, right before launching steam
    line      => $custom_command,
    subscribe => Package['steam'],
  }


## OLD steam install thing, this will fail in puppet for new installs
  file_line { 'steamapps-new':
    path      => '/usr/bin/steam',
    match     => 'CUSTOM VIA PUPPET',
    replace   => false,
    after     => '^cd "\$LAUNCHSTEAMDIR"$', # regex
    line      => $custom_command,
    subscribe => Package['steam'],
  }


}
