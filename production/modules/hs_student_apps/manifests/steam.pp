class hs_student_apps::steam {

  # https://steamcdn-a.akamaihd.net/client/installer/steam.deb

	file { '/opt/steam':
		ensure	=> directory,
	}

	file { 'steam-deb':
		path	=> '/opt/steam/steam.deb',
		owner	=> root,
		group	=> root,
		mode	=> '644',
		ensure	=> present,
		source	=> 'puppet:///modules/hs_student_apps/steam.deb',
		require => File['/opt/steam'],
	}

	include gdebi
	package { 'steam':
		provider => gdebi,
		ensure	=> latest,
		source => '/opt/steam/steam.deb',
		require => File['steam-deb'],
	}

  file { 'steam-launcher':
		path	=> '/usr/bin/steam',
		owner	=> root,
		group	=> root,
		mode	=> '755',
		ensure	=> latest,
		source	=> 'puppet:///modules/hs_student_apps/steam',
		require => Package['steam'],
	}

}
