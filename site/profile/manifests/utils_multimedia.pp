class profile::utils_multimedia {

  package {'vlc':
      ensure => latest,
  }
  # Needed to play midi audio
  package{'vlc-plugin-fluidsynth':
      ensure => latest,
  }
  # Video Codecs
  package{'libgstreamer-plugins-bad1.0.0':
      ensure => latest,
  }
  package{'gstreamer1.0-plugins-bad':
      ensure => latest,
  }


  #############
  #
  # Kaku
  # http://kaku.rocks/
  #
  #############

  include wget
  include gdebi

  wget::fetch { 'Kaku-1.9.0-amd64.deb':
    source  => 'https://github.com/EragonJ/Kaku/releases/download/1.9.0/Kaku-1.9.0-amd64.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
  package { 'kaku':
    provider => gdebi,
    ensure	=> latest,
    source => '/tmp/Kaku-1.9.0-amd64.deb',
  }

  # ###########
  #
  # Spotify
  #
  # ############

  include apt

  apt::source { 'spotify-repo':
		location => 'http://repository.spotify.com',
		release	 => 'stable',
		repos    => 'non-free',
		key 		 => {
			id      => 'BBEBDCB318AD50EC6865090613B00F1FD2C19886',
			server  => 'hkp://keyserver.ubuntu.com:80',
		},
  }
  package { 'spotify-client':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Source['spotify-repo'] ],
  }

}
