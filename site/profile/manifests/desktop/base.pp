#
class profile::desktop::base {

  package { 'ubuntu-desktop':
    ensure  => latest,
  }

  package { 'nvidia-drivers-440':
    ensure  => latest,
    require => Package['ubuntu-desktop'],
    notify  => Reboot['after_run'],
  }

  reboot { 'after_run':
    apply   => finished,
  }

}
