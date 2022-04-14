##########################
#
#   LUTRIS (Open Gaming Platform)
#   See: https://lutris.net/downloads/
#
###########################
class profile::games::lutris {

  include profile::common::wine



  apt::ppa { 'ppa:lutris-team/lutris':
    ensure  => present,
    require => Package['apt-transport-https']
  }
  # apt::source { 'lutris-ppa':
  #   location => 'http://download.opensuse.org/repositories/home:/strycore/xUbuntu_16.04/',
  #   repos    => '',
  #   release  => './',
  #   key      => {
  #     'id'     => 'FD5B64B9',
  #     #'server' => 'https://keyserver.ubuntu.com',
  #     'source' => 'http://download.opensuse.org/repositories/home:/strycore/xUbuntu_16.04/Release.key',
  #   },
  # }
  package { 'lutris':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Ppa['ppa:lutris-team/lutris'] ],
  }

  ########################
  #
  # LEAGUE OF LEGENDS
  #
  ########################

  # League of Legends' anticheat requires using a modified version of wine and changing a system setting. 
  # Otherwise, the game will crash after champion select. 
  # Wine-lol comes with the Lutris installer, but as far as this script can detect, the setting has not been changed yet.
  # Note: The setting (abi.vsyscall32=0) may reduce the performance of some 32 bit applications.
  # sudo sh -c 'echo "abi.vsyscall32 = 0" >> /etc/sysctl.conf && sysctl -p'

  file_line { 'update_sysctl.conf_for_league':
    path => '/etc/sysctl.conf',
    line => 'abi.vsyscall32 = 0',
  }

  exec { '/usr/sbin/sysctl -p':
    subscribe   => File_line['update_sysctl.conf_for_league'],
    refreshonly => true,
  }

  ## Needed for League of Legends installer
  package { 'dialog':
    ensure  => latest,
  }
  package { 'libfreetype6:i386':
    ensure  => latest,
  }

  apt::ppa { 'ppa:ppa:damentz/liquorix':
    ensure  => present,
  }
  package { 'linux-image-liquorix-amd64':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Ppa['ppa:ppa:damentz/liquorix'] ],
    notify  => Reboot['after_run'],
  }
  package { 'linux-headers-liquorix-amd64':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Ppa['ppa:ppa:damentz/liquorix'] ],
    notify  => Reboot['after_run'],
  }

  ## END LOL DEPENDANCIES ##

}
