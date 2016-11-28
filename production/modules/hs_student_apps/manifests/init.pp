class hs_student_apps {

  include apt
  include 'google_chrome'
  
  # MEDIA
  package {'vlc': }

  #############
  #
  # From Official Repositories
  #
  #############

  package { 'supertuxkart':  }
  package { 'supertux': }
  package { 'tuxguitar':  }
  package { 'musescore':  }
  package { 'chromium-browser':   }
  
  package { 'shotwell': }
  package { 'rawtherapee': }
  package { 'darktable': }

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
      ensure  => absent,
  }
  
  package { 'krita-2.9':
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

  package { 'lame': }
  package { 'libmp3lame0': }
  package { 'audacity': }


}
