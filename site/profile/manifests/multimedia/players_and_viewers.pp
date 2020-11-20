#
class profile::multimedia::players_and_viewers {

  package {'vlc':
    ensure => latest,
  }

  package {'vlc-plugin-fluidsynth':
    ensure => latest,
  }

  package {'openshot':
    ensure => latest,
  }


  #############
  #
  # Kaku
  # http://kaku.rocks/
  #
  #############

  include gdebi

  $kaku_version = '2.0.2'

  archive{ '/tmp/Kaku.deb':
    ensure => present,
    source => "https://github.com/EragonJ/Kaku/releases/download/${kaku_version}/Kaku_${kaku_version}_amd64.deb",
  }

  package { 'kaku':
    ensure    => latest,
    provider  => gdebi,
    source    => '/tmp/Kaku.deb',
    subscribe => Archive['/tmp/Kaku.deb']
  }

  # ###########
  #
  # Spotify
  # https://www.spotify.com/ca-en/download/linux/
  #
  # ############


  include apt

  # manually add public key to /etc/apt/trusted.gpg.d/ directory

  apt::source { 'spotify-stable-repo':
    location => 'http://repository.spotify.com',
    release  => 'stable',
    repos    => 'non-free',
    key      => {
    #   id     => '2EBF997C15BDA244B6EBF5D84773BD5E130D1D45',
    #   id     => '931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90',
      id     => '8FD3D9A8D3800305A9FFF259D1742AD60D811D58',
      # id     => 'D1742AD60D811D58',
      server => 'hkp://keyserver.ubuntu.com:80',
    },
  }
  package { 'spotify-client':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Source['spotify-stable-repo'] ],
  }

}
