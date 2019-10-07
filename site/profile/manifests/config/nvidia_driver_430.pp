# requires rgb-nvidia module
class profile::config::nvidia_driver_430 {

  include apt

  apt::ppa { 'ppa:graphics-drivers/ppa':
    ensure => present,
  }

  package {'nvidia-430 ':
    ensure => latest,
  }

}
