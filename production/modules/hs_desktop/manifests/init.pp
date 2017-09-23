class hs_desktop {

  package { 'cinnamon':
      ensure  => latest,
  }

  package { 'cinnamon-desktop-environment':
      ensure  => latest,
      require => Package['cinnamon'],
  }
  
  package { 'nitrogen':
      ensure => latest,
  }

  package {'xfce4':
      ensure  => latest,
  }

  package { 'unity-greeter-badges':
      ensure  => latest,
  }


}


