class profile::utils_fonts {

  package{'typecatcher':
    ensure => latest,
  }
  package{'unifont':
    ensure => latest,
  }

  package{'ttf-mscorefonts-installer':
    ensure => latest,
  }



}