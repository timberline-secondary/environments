class profile::utils_fonts {

  package{'typecatcher':
    ensure => latest,
  }
  package{'unifont':
    ensure => latest,
  }

  # # V 3.4 buggy (as of Apr 2018), use deb instead.
  # package{'ttf-mscorefonts-installer':
  #   ensure => purged,
  # }

  include wget
  include gdebi

  # MS Core Fonts
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

  # MS Vista/ClearType Fonts
  # https://www.pcworld.com/article/2863497/how-to-install-microsoft-fonts-in-linux-office-suites.html
  package {'fontforge':
    ensure => latest,
  }
  package {'cabextract':
    ensure => latest,
  }

  exec {'ms_vista_fonts':
    command => "wget https://gist.github.com/maxwelleite/10774746/raw/ttf-vista-fonts-installer.sh -q -O - | sudo bash",
    path    => "/usr/bin/",
    creates => "/usr/share/fonts/truetype/vista"
  }

}