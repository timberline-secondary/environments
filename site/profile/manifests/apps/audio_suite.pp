class profile::apps::audio_suite {

  include apt

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

  apt::ppa { 'ppa:mscore-ubuntu/mscore3-stable':
      ensure => present,
  }
  package { 'musescore':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Ppa['ppa:mscore-ubuntu/mscore3-stable'] ],
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
