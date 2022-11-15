class profile::config::nvidia_drivers_520 {

  package { 'dkms':
    ensure => latest,
  }

  package { 'nvidia-driver-520':
    ensure => latest,
  }

  package { 'nvidia-dkms-520':
    ensure => latest,
  }

  package { 'nvidia-cuda-toolkit':
    ensure  => latest,
    require => Package['nvidia-driver-420'],
    # notify  => Reboot['after_run'],
  }

}
