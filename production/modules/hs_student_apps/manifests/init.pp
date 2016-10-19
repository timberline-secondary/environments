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


  #############
  #
  # Blender
  #
  #############

  apt::ppa { 'ppa:thomas-schiex/blender': 
      ensure => present,
  }
  package { 'blender':
      ensure  => '2.78~release~1475052116-0thomas~xenial1',
      require => [ Class['apt::update'], Apt::Ppa['ppa:thomas-schiex/blender'] ],
  }
  
  # Overwrite netrender addon to allow for use of GPU on slaves
  # https://github.com/WARP-LAB/Blender-Network-Render-Additions
  
  # fully managed directory: https://christian.hofstaedtler.name/blog/2008/11/puppet-managing-directories-recursively.html
  file { 'blender-netrender-addon':
    path    => '/usr/share/blender/2.78/scripts/addons/netrender',
    recurse => true,
    purge   => true,
    force   => true,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    ensure  => directory,
    require => Package['blender'],
    source  =>
  } 
  
 # file { 'lightdm.conf':
 #   path    => '/etc/lightdm/lightdm.conf',
 #   ensure  => file,
 #   source  => "https://github.com/WARP-LAB/Blender-Network-Render-Additions.git",
 #   require => File['/etc/lightdm'],
 # }

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
