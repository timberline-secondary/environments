# requires rgb-nvidia module
class profile::config::nvidia_driver_430 {

  class { 'nvidia':
    version => 430
  }

}
