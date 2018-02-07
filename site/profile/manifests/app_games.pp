class profile::app_games {

  package { 'playonlinux':
    ensure => latest,
  }

  #########################
  #
  #  MINECRAFT
  #  https://launchpad.net/~flexiondotorg/+archive/ubuntu/minecraft
  #
  #########################

  apt::ppa { 'ppa:flexiondotorg/minecraft':
      ensure => present,
  }
  package { 'minecraft-installer':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:flexiondotorg/minecraft'] ],
  }

  ##########################
  #
  #   OPENRA
  #
  ###########################

  include wget
  include gdebi

  wget::fetch { 'openra_playtest.20180102_all.deb':
    source  => 'https://github.com/OpenRA/OpenRA/releases/download/playtest-20180102/openra_playtest.20180102_all.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
  package { 'openra':
    provider => gdebi,
    ensure	=> latest,
    source => '/tmp/openra_playtest.20180102_all.deb',
  }

}