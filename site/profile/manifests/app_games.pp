class profile::app_games {

  package { 'supertuxkart':
      ensure => latest,
  }

  package { 'supertux':
      ensure => latest,
  }


  #########################
  #
  #  MINECRAFT
  #  https://launchpad.net/~flexiondotorg/+archive/ubuntu/minecraft
  #
  #########################

  apt::ppa { 'ppa:flexiondotorg/minecraft':
      ensure => latest,
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


  # http://www.openra.net/download/
  wget::fetch { 'openra_release.20180307_all.deb':
    source  => 'https://github.com/OpenRA/OpenRA/releases/download/release-20180307/openra_release.20180307_all.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
  package { 'openra':
    provider => gdebi,
    ensure	=> latest,
    source => '/tmp/openra_release.20180307_all.deb',
  }



  ##########################
  #
  #   LUTRIS (Open Gaming Platform)
  #   See: https://lutris.net/downloads/
  #
  ###########################

  include profile::common_wine
  include apt

  apt::source { 'lutris-repo':
    location => 'http://download.opensuse.org/repositories/home:/strycore/xUbuntu_16.04/ ./',
    repos    => '',
    release  => './',
    key      => {
      'id'     => 'FD5B64B9',
      #'server' => 'https://keyserver.ubuntu.com',
      'source'  => 'http://download.opensuse.org/repositories/home:/strycore/xUbuntu_16.04/Release.key',
    },
  } ~>
  package { 'lutris':
    ensure	=> latest,
  }


}