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
    # subscribe => Package['ubuntu-desktop'],  # si this needed for when ubuntu-desktop updates?
  }
  package {'thunderbird':
    ensure  => purged,
    require => Package['ubuntu-desktop'],
    # subscribe => Package['ubuntu-desktop'],
  }
  package {'gnome-initial-setup':
    ensure  => absent,
    require => Package['ubuntu-desktop'],
    # subscribe => Package['ubuntu-desktop'],
  }


  # Graphics drivers (installed in preseed, this keeps them up to date)
  package { 'nvidia-driver-440':
    ensure  => latest,
    require => Package['ubuntu-desktop'],
    notify  => Reboot['after_run'],
  }
  package { 'nvidia-cuda-toolkit':
    ensure  => latest,
    require => Package['nvidia-driver-440'],
    notify  => Reboot['after_run'],
  }


  # https://help.ubuntu.com/community/NumLock
  package { 'numlockx':
    ensure => latest,
  }


}
