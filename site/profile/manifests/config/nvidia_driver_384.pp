# requires rgb-nvidia module
class profile::config::nvidia_driver_384 {

  package { 'nvidia-384':
    ensure  => latest
  }

}
