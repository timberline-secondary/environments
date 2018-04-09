class profile::dev_java {

  package { 'eclipse':
		ensure  => latest,
	}

  apt::ppa { 'ppa:mmk2410/intellij-idea':
      ensure => present,
  }
  package { 'intellij-idea-ultimate':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:mmk2410/intellij-idea'] ],
  }


}