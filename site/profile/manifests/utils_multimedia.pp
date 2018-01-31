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

  include wget
  include gdebi

  wget::fetch { 'spotify-client_1.0.70.399.g5ffabd56-27_i386.deb':
    source  => 'http://repository.spotify.com/pool/non-free/s/spotify-client/spotify-client_1.0.70.399.g5ffabd56-27_i386.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
  package { 'spotify-client':
    provider => gdebi,
    ensure	=> latest,
    source => '/tmp/spotify-client_1.0.70.399.g5ffabd56-27_i386.deb',
  }


}
