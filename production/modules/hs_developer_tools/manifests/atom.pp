	file { '/opt/appinventor': 
		ensure	=> directory,
	}

	file { 'app-inventor-2-deb':
		path	=> '/opt/appinventor/appinventor2-setup_2.3_all.deb',
		owner	=> root,
		group	=> root,
		mode	=> '644',
		ensure	=> present,
		source	=> 'puppet:///modules/hs_developer_tools/appinventor2-setup_2.3_all.deb',
		require => File['/opt/appinventor'],
	}
	
	include gdebi
	package { 'app-inventer-2': 
		provider => gdebi,
		ensure	=> latest,
		source => '/opt/appinventor/appinventor2-setup_2.3_all.deb',
		require => File['app-inventor-2-deb'],
}
