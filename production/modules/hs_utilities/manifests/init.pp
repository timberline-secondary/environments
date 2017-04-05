
class hs_utilities {

  notify { 'Puppet Module - Utilities': }


  package {'icc-profiles':}
  package {'icc-profiles-free':}


  package {'iptux':}


  # apt::ppa { 'ppa:ubuntu-wine/ppa':
  #     ensure => present,
  # }
  # package { 'wine1.8':
  #     ensure  => latest,
  #     require => [ Class['apt::update'], Apt::Ppa['ppa:ubuntu-wine/ppa'] ],
  # }

  package { 'wine':
    ensure  => latest,
  }
  package { 'playonlinux':
    ensure  => latest,
  }
  
  # Screen gif capturing
  apt::ppa { 'ppa:sethj/silentcast': 
      ensure => present,
  }
  package { 'silentcast':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:sethj/silentcast'] ],
  }  
  package { 'byzanz': 
    ensure  => latest,
  }

  package { 'unity-tweak-tool':
    ensure  => latest,
  }

  package { 'gnome-tweak-tool':
    ensure  => latest,
  }

  # Themes
  # apt::ppa { 'ppa:noobslab/themes':
  #     ensure => present,
  # }
  # PPA doesn't provide these themes for Xenial
  # package { 'vertex-theme':
  #     ensure  => latest,
  #     require => [ Class['apt::update'], Apt::Ppa['ppa:noobslab/themes'] ],
  # }
  # package { 'ceti-theme':
  #     ensure  => latest,
  #     require => [ Class['apt::update'], Apt::Ppa['ppa:noobslab/themes'] ],
  # }
  
  # for Chromium
  package {'pepperflashplugin-nonfree':
    ensure  => latest,
  }
  # for Firefox
  package {'flashplugin-installer':
    ensure => latest,
  }
  
  package{'kmag':}
  package{'unzip':}
  package{'photoprint':}
  package{'typecatcher':}
  package{'unifont':}
  package{'screen':}
  
  #Video Codecs
  package{'libgstreamer-plugins-bad1.0.0':}
  package{'gstreamer1.0-plugins-bad':}
  #Needed to play midi audio
  package{'vlc-plugin-fluidsynth':}
  
  package{'telnet':}
}
