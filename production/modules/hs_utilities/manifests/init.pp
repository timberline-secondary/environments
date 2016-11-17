
class hs_utilities {

  notify { 'Puppet Module - Utilities': }

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
  package{'typeprint':}
  
  #Video Codecs
  package{'libgstreamer-plugins-bad1.0.0':}
  package{'gstreamer1.0-plugins-bad':}
  
}
