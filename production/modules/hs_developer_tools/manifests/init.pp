class hs_developer_tools {
	notify { 'Puppet Module - Developer Tools': }
	
	package { 'git': 
          ensure  => latest,
        }
	
	package {'virtualbox':}
	package {'virtualbox-ext-pack':}
	  include apt
  
	apt::ppa { 'ppa:webupd8team/atom': 
	      ensure => latest,
	}
	package { 'atom':
	      require => [ Class['apt::update'], Apt::Ppa['ppa:webupd8team/atom'] ],
	}
	
	
}
