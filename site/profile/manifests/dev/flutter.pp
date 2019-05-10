class profile::dev::flutter {

  apt::ppa { 'ppa:maarten-fonville/android-studio':
    ensure => present,
  }
  package { 'android-studio':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Ppa['ppa:maarten-fonville/android-studio'] ],
  }

}