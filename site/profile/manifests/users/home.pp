class profile::users::home {

  ############################################
  #
  #            AUTO FS
  # https://help.ubuntu.com/community/Autofs
  # file_line: https://forge.puppet.com/puppetlabs/stdlib#resources
  #
  #############################################

  autofs::mount { 'home':
    mount       => '/home',
    mapfile     => '/etc/auto.home',
    mapcontents => ['* -fstype=nfs,rw,async tyrell:/nfshome/&'],
    options     => '--timeout=120',
    order       => 01,
  }

  file { '/shared':
    ensure => 'directory',
    mode   => '0777',
  }

}

#### OLD METHOD ####
/*
  package { autofs:
    ensure => present,
  }
  file { 'auto.home':
    path    => '/etc/auto.home',
    ensure  => file,
    content => "* -fstype=nfs,rw,async tyrell:/nfshome/&",
    require => Package['autofs'],
  }
  file_line { 'auto.master':
    path    => '/etc/auto.master',
    line    => '/home   /etc/auto.home',
    require => Package['autofs'],
  }
*/