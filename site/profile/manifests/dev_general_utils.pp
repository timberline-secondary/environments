class profile::dev_general_utils {

  apt::ppa { 'ppa:webupd8team/atom':
      ensure => present,
  }
  package { 'atom':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:webupd8team/atom'] ],
  }

  package { 'git':
      ensure  => latest,
  }



}