class hs_developer_tools::android {
	
  apt::ppa { 'ppa:paolorotolo/android-studio':
      ensure => present,
  }
  package { 'android-studio':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:paolorotolo/android-studio'] ],
  }

}
