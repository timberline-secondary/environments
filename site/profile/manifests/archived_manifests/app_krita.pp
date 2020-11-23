class profile::app_krita {

  include apt

  apt::ppa { 'ppa:dimula73/krita':
      ensure => present,
  }
  package { 'krita-2.9':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Ppa['ppa:dimula73/krita'] ],
  }

}
