#
class profile::multimedia::players_and_viewers {

  package {'vlc':
    ensure => latest,
  }

  package {'vlc-plugin-fluidsynth':
    ensure => latest,
  }

}
