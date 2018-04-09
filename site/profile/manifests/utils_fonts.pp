class profile::utils_fonts {

  package{'typecatcher':
    ensure => latest,
  }
  package{'unifont':
    ensure => latest,
  }

  # V 3.4 buggy (as of Apr 2018), use deb instead.
  package{'ttf-mscorefonts-installer':
    ensure => purged,
  }


}