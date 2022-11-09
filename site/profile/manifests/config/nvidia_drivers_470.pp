class profile::config::nvidia_drivers_470 {

  package { 'dkms':
    ensure => latest,
  }

  package { 'nvidia-driver-470':
    ensure => latest,
  }

  package { 'nvidia-dkms-470':
    ensure  => latest,
    require => Package['dkms'],
  }

  package { 'nvidia-cuda-toolkit':
    ensure  => latest,
    require => Package['nvidia-driver-470'],
    # notify  => Reboot['after_run'],
  }

}
