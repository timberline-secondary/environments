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

  ############
  #
  # Spotify
  #
  #############

  # include ::snapd
  #
  # package { 'spotify':
  #   provider  => 'snap',
  #   ensure  => latest,
  #   require => Class['apt::update'],
  # }

}
