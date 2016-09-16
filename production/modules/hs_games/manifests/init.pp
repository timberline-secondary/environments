class hs_games {

  notify { 'Puppet Module - Games': }

	file { 'openra-deb':
		path	=> '/opt/openra/openra_release.20160508_all.deb',
		owner	=> root,
		group	=> root,
		mode	=> '644',
		ensure	=> present,
		source	=> 'puppet:///modules/hs_games/openra_release.20160508_all.deb',
		require => File['/opt/openra'],
	}
	
	include gdebi
	package { 'openra': 
		provider => gdebi,
		ensure	=> latest,
		source => '/opt/openra/openra_release.20160508_all.deb',
		require => File['openra-deb'],
  	}

}

