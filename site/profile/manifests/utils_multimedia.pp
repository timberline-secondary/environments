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

  include gdebi
  package { 'kaku':
    provider => gdebi,
    ensure	=> latest,
    source => 'https://github.com/EragonJ/Kaku/releases/download/1.9.0/Kaku-1.9.0-amd64.deb',
  }

}
