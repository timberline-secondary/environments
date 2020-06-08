#
class profile::config::timezone {

  exec {'set-timezone':
    command => "timedatectl set-timezone America/Vancouver",
    path    => "/usr/bin/",
  }

}
