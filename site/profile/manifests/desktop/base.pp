#
class profile::desktop::base {

  include profile::utils::reboot_after_run

  package { 'ubuntu-desktop':
    ensure  => latest,
  }

  # remove unwanted packages installed with ubuntu-dresktop
  package {'rhythmbox':
    ensure  => purged,
    require => Package['ubuntu-desktop'],
    # subscribe => Package['ubuntu-desktop'],
  }
  package {'thunderbird':
    ensure  => purged,
    require => Package['ubuntu-desktop'],
    # subscribe => Package['ubuntu-desktop'],
  }

  package { 'nvidia-driver-440':
    ensure  => latest,
    require => Package['ubuntu-desktop'],
    notify  => Reboot['after_run'],
  }

  # https://help.ubuntu.com/community/NumLock
  package { 'numlockx':
    ensure => latest,
  }

}
