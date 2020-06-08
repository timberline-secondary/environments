class profile::apps::audio_suite {


  #############
  #
  # Audacity
  #
  #############

  package { 'lame':
    ensure  => latest,
  }
  package { 'libmp3lame0':
    ensure  => latest,
  }
  package { 'audacity':
    ensure  => latest,
  }


  #############
  #
  # LMMS
  #
  #############

  # Linux MultiMedia Suite (Audio track editing/mixing)
  package { 'lmms':
      ensure  => latest,
  }


  #############
  #
  # Musescore
  #
  #############

  package { 'musescore':
      ensure  => latest,
  }


  #############
  #
  # Tux Guitar
  #
  #############

  package { 'tuxguitar':
      ensure  => latest,
  }
  package { 'tuxguitar-jsa':
      ensure  => latest,
  }


  #############
  #
  # MIXXX
  #
  #############

  package { 'mixxx':
      ensure  => latest,
  }


}
