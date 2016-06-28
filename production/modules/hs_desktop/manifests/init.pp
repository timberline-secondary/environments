class hs_desktop {

  package { 'cinnamon':
      ensure  => latest,
  }

  package { 'cinnamon-desktop-environment':
      ensure  => latest,
      require => Package['cinnamon'],
  }


}


