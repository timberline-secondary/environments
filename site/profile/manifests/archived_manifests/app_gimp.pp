class profile::app_gimp {

  include apt

  apt::ppa { 'ppa:otto-kesselgulasch/gimp':
      ensure => present,
  }
  package { 'gimp':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:otto-kesselgulasch/gimp'] ],
  }
  package { 'gmic':
      ensure  => absent,
      require => [ Class['apt::update'], Package['gimp'] ],
  }
  package { 'gimp-gmic':
      ensure  => absent,
      require => [ Class['apt::update'], Package['gimp'],  Package['gmic'] ],
  }

  package { 'gimp-plugin-registry':
      ensure  => absent,
      require => [ Class['apt::update'], Package['gimp'] ],
}

}
