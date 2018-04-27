class profile::utils_netstat {

  package {'net-tools':
      ensure => latest,
  }

}