class profile::games::lutris {
  ##########################
  #
  #   LUTRIS (Open Gaming Platform)
  #   See: https://lutris.net/downloads/
  #
  ###########################

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

}
