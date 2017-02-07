class hs_student_apps::spotify {

	# https://github.com/Quacky2200/Spotify-Web-Player-for-Linux/releases

	file { '/opt/spotify-web-player':
		ensure	=> directory,
	}

	
	file { 'spotify-web-player-deb':
		path	=> '/opt/spotify/spotifywebplayer_1.0.40_beta_amd64.deb',
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
		source => '/opt/spotify/spotifywebplayer_1.0.40_beta_amd64.deb',
		require => File['spotify-web-player-deb'],
	}
	

}
