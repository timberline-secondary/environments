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
		source	=> 'puppet:///modules/hs_student_apps/steam/steam.deb',
		require => File['/opt/steam'],
	}

	include gdebi
	package { 'steam':
		provider => gdebi,
		ensure	=> latest,
		source => '/opt/steam/steam.deb',
		require => File['steam-deb'],
	}

  file { '/usr/bin/steam':
		owner	=> root,
		group	=> root,
		mode	=> '755',
		ensure	=> present,
		source	=> 'puppet:///modules/hs_student_apps/steam/steam',
		subscribe => Package['steam'],
	}

  # Remove the update notifier to prevent pop-up on all users.
  file { 'steam-update-notifier':
    ensure => absent,
    path => '/var/lib/update-notifier/user.d/steam-install-notify',
    subscribe => Package['steam'],
  }
  
}
