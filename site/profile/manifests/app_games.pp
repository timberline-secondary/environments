class profile::app_games {

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

}