class hs_student_apps::spotify {

	# https://github.com/Quacky2200/Spotify-Web-Player-for-Linux/releases

	file { '/opt/spotify-web-player':
		ensure	=> directory,
	}

	
	file { 'spotify-web-player-deb':
		path	=> '/opt/spotify-web-player/spotifywebplayer_1.0.40_beta_amd64.deb',
		owner	=> root,
		group	=> root,
		mode	=> '644',
		ensure	=> present,
		source	=> 'puppet:///modules/hs_student_apps/spotify/spotifywebplayer_1.0.40_beta_amd64.deb',
		require => File['/opt/spotify-web-player'],
	}
	
	include gdebi
	package { 'spotify-web-player':
		provider => gdebi,
		ensure	=> latest,
		source => '/opt/spotify-web-player/spotifywebplayer_1.0.40_beta_amd64.deb',
		require => File['spotify-web-player-deb'],
	}

	## Above webplayer not working for some users do to updates in the official player. So try official player too
  # include apt
  #
  # apt::source { 'spotify':
		# location => 'http://repository.spotify.com',
		# release	 => 'stable',
		# repos    => 'non-free',
		# key 		 => {
		# 	id      => 'BBEBDCB318AD50EC6865090613B00F1FD2C19886',
		# 	server  => 'hkp://keyserver.ubuntu.com:80',
		# },
  # }
  # package { 'spotify-client':
  #   ensure  => latest,
  #   require => [ Class['apt::update'], Apt::Source['spotify'] ],
  # }


}
