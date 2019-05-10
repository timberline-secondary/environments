class profile::dev::flutter {

  package { 'android-sdk':
    ensure => latest,
  }

  apt::ppa { 'ppa:maarten-fonville/android-studio':
    ensure => present,
  }
  package { 'android-studio':
    # places Android studio in : /opt/android-studio
    # there is no desktop icon/start menu link
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Ppa['ppa:maarten-fonville/android-studio'] ],
  }

}