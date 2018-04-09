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

  include wget
  include gdebi

  wget::fetch { 'ttf-mscorefonts-installer_3.6_all.deb':
    source  => 'http://ftp.us.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb',
    destination => '/tmp/',
    cache_dir   => '/var/cache/wget',
  } ~>
  package { 'ttf-mscorefonts-installer_3.6':
    provider => gdebi,
    ensure	=> latest,
    source => '/tmp/ttf-mscorefonts-installer_3.6_all.deb',
  }

}