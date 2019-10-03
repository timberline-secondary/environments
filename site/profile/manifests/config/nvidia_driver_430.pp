# requires rgb-nvidia module
class profile::config::nvidia_driver_430 {

  package { 'nvidia-driver-430':
    ensure  => latest
  }

}
