# https://launchpad.net/~shnatsel/+archive/ubuntu/drawpile
class profile::apps::drawpile {

  include apt

  apt::ppa { 'ppa:shnatsel/drawpile':
      ensure => present,
  }
  package { 'drawpile':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Ppa['ppa:shnatsel/drawpile'] ],
  }

}
