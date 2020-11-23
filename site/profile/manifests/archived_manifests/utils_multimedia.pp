class profile::utils_multimedia {

  ## FFMPEG
  apt::ppa { 'ppa:jonathonf/ffmpeg-4':
      ensure => present,
  }
  package { 'ffmpeg':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:jonathonf/ffmpeg-4'] ],
  }

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

  package{'openshot':
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

  wget::fetch { 'Kaku_2.0.2_amd64.deb':
    source  => 'https://github.com/EragonJ/Kaku/releases/download/2.0.2/Kaku_2.0.2_amd64.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
  package { 'kaku':
    provider => gdebi,
    ensure   => latest,
    source   => '/tmp/Kaku_2.0.2_amd64.deb',
  }

  # ###########
  #
  # Spotify
  # https://www.spotify.com/ca-en/download/linux/
  # Use mint repo for this
  #
  # ############

  # include profile::common_additional_repos
  # # from mint sylvia repo
  # package{'spotify-client':
  #     ensure => latest,
  # }

  include apt

  apt::source { 'spotify-stable-repo':
    location => 'http://repository.spotify.com',
    release  => 'stable',
    repos    => 'non-free',
    key      => {
      id     => '2EBF997C15BDA244B6EBF5D84773BD5E130D1D45',
      # id     => '931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90',
      # id     => 'EFDC8610341D9410',
      server => 'hkp://keyserver.ubuntu.com:80',
      },
  }
  package { 'spotify-client':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Source['spotify-stable-repo'] ],
  }

}
