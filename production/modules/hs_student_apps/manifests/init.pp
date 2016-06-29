class hs_student_apps {

  include apt
  #include 'google_chrome'

  #############
  #
  # From Official Repositories
  #
  #############

  package { 'supertuxkart':  }
  package { 'tuxguitar':  }
  package { 'musescore':  }
  package { 'chromium-browser':   }
  package { 'quagrapassel': }


  #############
  #
  # Blender
  #
  #############

  apt::ppa { 'ppa:thomas-schiex/blender': 
      ensure => present,
  }
  package { 'blender':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:thomas-schiex/blender'] ],
  }

  #############
  #  
  # GIMP
  #
  #############

  apt::ppa { 'ppa:otto-kesselgulasch/gimp':
      ensure => present,
  }
  package { 'gimp':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:otto-kesselgulasch/gimp'] ],
  }
  package { 'gmic':
      ensure  => latest,
      require => [ Class['apt::update'], Package['gimp'] ],
  }
  package { 'gimp-gmic':
      ensure  => latest,
      require => [ Class['apt::update'], Package['gimp'],  Package['gmic'] ],
  }


  #############
  #
  # Krita
  #
  #############

  apt::ppa { 'ppa:dimula73/krita':
      ensure => present,
  }
  package { 'krita3-testing':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:dimula73/krita'] ],
  }


  #############
  #
  # Inkscape
  #
  #############

  apt::ppa { 'ppa:inkscape.dev/stable':
      ensure => present,
  }
  package { 'inkscape':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:inkscape.dev/stable'] ],
  }


  #############
  #
  # Audacity
  #
  #############

  #apt::ppa { 'ppa:ubuntuhandbook1/audacity':
  #    ensure => present,
  #}
  #package { 'audacity':
  #    ensure  => latest,
  #    require => [ Class['apt::update'], Apt::Ppa['ppa:ubuntuhandbook1/audacity'] ],
  #}
  #package { 'lame': }
  #package { 'libmp3lame0': }


}
