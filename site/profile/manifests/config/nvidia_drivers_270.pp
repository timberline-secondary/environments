class profile::config::nvidia_drivers_270 {

  package { 'dkms':
    ensure => latest,
  }

  package { 'nvidia-driver-470':
    ensure => latest,
  }

  package { 'nvidia-dkms-470':
    ensure => latest,
  }

}
