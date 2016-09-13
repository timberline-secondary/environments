
class hs_utilities {

  notify { 'Puppet Module - Utilities': }

  package { 'wine':
    ensure  => latest,
  }
  
  # Screen gif capturing
  apt::ppa { 'ppa:sethj/silentcast': 
      ensure => present,
  }
  package { 'silentcast':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:sethj/silentcast'] ],
  }  
  
  package { 'unity-tweak-tool': 
    ensure  => latest,
  }
  
  
}
