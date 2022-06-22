class profile::config::nvidia_drivers_270 {

  package { 'dkms':
    ensure => latest,
  }

  package { 'nvidia-drivers-470':
    ensure => latest,
  }

  package { 'nvidia-dkms-470':
    ensure => latest,
  }

}
