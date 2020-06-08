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
    ensure  => latest
    source  => "https://github.com/EragonJ/Kaku/releases/download/${kaku_version}/Kaku_${kaku_version}_amd64.deb",
  }
  package { 'kaku':
    provider => gdebi,
    ensure   => latest,
    source   => '/tmp/Kaku.deb',
    subscribe=> Archive['/tmp/Kaku.deb']
  }

}
