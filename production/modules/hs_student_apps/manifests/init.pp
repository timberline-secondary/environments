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
  package { 'tuxguitar-jsa':}
  package { 'musescore':  }
  
  package { 'chromium-browser':   }
  
  package { 'shotwell': }
  package { 'rawtherapee': }
  package { 'darktable': }

  # Linux Multimedia Suite (Audio track editing/mixing)
  package { 'lmms': }

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
  package { 'krita-2.9':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Ppa['ppa:dimula73/krita'] ],
  }

  # https://launchpad.net/~kritalime/+archive/ubuntu/ppa
  # apt::ppa { 'ppa:kritalime/ppa':
  #     ensure => present,
  # }
  # package { 'krita-2.9':
  #     ensure  => latest,
  #     require => [ Class['apt::update'], Apt::Ppa['ppa:dimula73/krita'] ],
  # }


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

  # file { 'inkscape-ppa':
  #   path    => '/etc/apt/sources.list.d/inkscape_dev-stable-xenial.list',
  #   ensure  => absent,
  # }
  # file { 'inkscape-ppa2':
  #   path    => '/etc/apt/sources.list.d/inkscape_dev-ubuntu-stable-xenial.list',
  #   ensure  => absent,
  # }
  # file { 'inkscape-ppa3':
  #   path    => '/etc/apt/sources.list.d/inkscape_dev-ubuntu-stable-xenial.list.save',
  #   ensure  => absent,
  # }



  #############
  #
  # Audacity
  #
  #############

  package { 'lame': }
  package { 'libmp3lame0': }
  package { 'audacity': }


  #############
  #
  # CURA (3D Printing)
  #
  #############

  apt::ppa { 'ppa:thopiekar/cura':
      ensure => present,
  }
  package { 'cura':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:thopiekar/cura'] ],
  }
  package { 'cura-plugins':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:thopiekar/cura'] ],
  }
  package { 'cura-extra-plugins-all':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:thopiekar/cura'] ],
  }

}
