#
class profile::config::timezone {

  exec {'set-timezone':
    command => "timedatectl set-timezone Australia/Sydney",
    path    => "/usr/bin/",
  }

}
