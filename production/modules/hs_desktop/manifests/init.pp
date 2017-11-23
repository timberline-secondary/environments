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

  apt::ppa { 'ppa:niko2040/e19':
      ensure => present,
  }
  package { 'enlightenment':
      ensure  => latest,
      require => [ Class['apt::update'], Apt::Ppa['ppa:niko2040/e19'] ],
  }

  package { 'unity-greeter-badges':
      ensure  => latest,
  }


}


