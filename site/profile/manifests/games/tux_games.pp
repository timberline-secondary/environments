#
class profile::games::tux_games {

  package { 'tuxpaint':
    ensure => present,
  }

  package { 'tuxmath':
    ensure => present,
  }

  package { 'extremetuxracer':
    ensure => present,
  }

  package { 'freedroidrpg':
    ensure => present,
  }

  package { 'warmux':
    ensure => present,
  }

  apt::ppa { 'ppa:stk/dev':
    ensure => present,
  }

  package { 'supertuxkart':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:stk/dev'] ],
  }

  apt::ppa { 'ppa:ubuntuhandbook1/supertux':
    ensure => present,
  }

  package { 'supertux':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:ubuntuhandbook1/supertux'] ],
  }



}
