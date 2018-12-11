class profile::app_CAD {

  apt::ppa { 'ppa:neomilium/cam':
      ensure => present,
  }
  package { 'heekscad':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:neomilium/cam'] ],
  }
  package { 'heekscnc':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:neomilium/cam'] ],
  }
  # package { '??':
  #   ensure  => latest,
  #   require => [ Class['apt::update'], Apt::Ppa['ppa:neomilium/cam'] ],
  # }
}