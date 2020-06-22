#
class profile::games::steam {

  # https://steamcdn-a.akamaihd.net/client/installer/steam.deb

  # https://github.com/ValveSoftware/steam-for-linux/issues/5884#issuecomment-437690163
  package { 'libnvidia-gl-440:i386':
      ensure => latest,
  }

  package { 'steam':
      ensure => latest,
  }

  # Remove the update notifier to prevent pop-up on all users.
  file { 'steam-update-notifier':
    ensure    => absent,
    path      => '/var/lib/update-notifier/user.d/steam-install-notify',
    subscribe => Package['steam'],
  }

  # symlink the user's steamapps directory to local filesystem so games aren't played over the network
  # place this in the steam launch script at /usr/bin/steam right before the script exec's the launcher
  file_line { 'steamapps':
    path      => '/usr/bin/steam',
    match     => '^cd "\$LAUNCHSTEAMDIR"\n',
    line      => "cd \"$LAUNCHSTEAMDIR\"

#############################################
#
# Custom (this modifies the install path of steam)
#
#############################################

rm -r \"/home/$USER/.local/share/Steam/steamapps\" # removes steam directory in home drive
mkdir -p \"/shared/$USER/steamapps\" # makes user > steamapps in shared directory under user
ln -sf \"/shared/$USER/steamapps\" \"/home/$USER/.local/share/Steam\" # links the shared folder to user local home

############### End Custom ###################
",
    subscribe => Package['steam'],
  }


  # include wget
  # include gdebi

  # wget::fetch { 'steam.deb':
  #   source      => 'https://steamcdn-a.akamaihd.net/client/installer/steam.deb',
  #   destination => '/tmp/',
  #   cache_dir   => '/var/cache/wget',
  # } ~>
  # package { 'steam':
  #   ensure   => latest,
  #   provider => gdebi,
  #   source   => '/tmp/steam.deb',
  # }

  # package { 'steam':
  #     # ensure => latest,
  #     ensure => purged,
  # }

  # package { 'steamcmd':
  #     # ensure => latest,
  #     ensure => purged,
  # }


  # file { '/usr/bin/steam':
  #   ensure  => file,
   # 	owner	=> root,
    # group	=> root,
    # mode	=> '755',
  #   source  => "puppet:///modules/profile/steam/steam",
  #   subscribe => Package['steam']
  # }
  #
  #
  # # Remove the update notifier to prevent pop-up on all users.
  # file { 'steam-update-notifier':
  #   ensure => absent,
  #   path => '/var/lib/update-notifier/user.d/steam-install-notify',
  #   subscribe => Package['steam'],
  # }

}
