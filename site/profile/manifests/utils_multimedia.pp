class profile::utils_multimedia {

  package {'vlc':
      ensure => present,
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

  include ::snapd

  package { 'spotify-client':
    source  => 'snap',
    ensure  => latest,
    require => Class['apt::update'],
  }

}
