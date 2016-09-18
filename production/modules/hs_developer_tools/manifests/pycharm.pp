
class hs_developer_tools::pycharm {
	
  apt::ppa { 'ppa:mystic-mirage/pycharm': 
      ensure => present,
  }
  package { 'pycharm':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:mystic-mirage/pycharm'] ],
  }

}
 
 
