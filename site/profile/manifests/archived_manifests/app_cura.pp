class profile::app_cura {


  # Purge Cura and reinstall
  # https://stackoverflow.com/questions/14088651/puppet-manifest-sudo-commands

  # Purge
  # exec { 'Refresh Cura':
  #   command => '/usr/bin/apt remove -y cura && /usr/bin/apt -y autoremove && touch /var/tmp/cura-refreshed',
  #   #path    => ['/usr/bin', '/usr/sbin',],
  #   creates  => '/var/tmp/cura-refreshed',
  # }

  apt::ppa { 'ppa:thopiekar/cura':
      ensure => present,
  }
  package { 'cura':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:thopiekar/cura'] ],
  }
  package { 'cura-plugins':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:thopiekar/cura'] ],
  }
  package { 'cura-extra-plugins-all':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Ppa['ppa:thopiekar/cura'] ],
  }
}
