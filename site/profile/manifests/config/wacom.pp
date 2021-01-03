# configure wacom tablet when user logs in.
class profile::config::wacom {

  # remove some old files from testing... (delete these lines after while)
  file { '/etc/profile.d/configure_wacom.sh':
    ensure => absent
  }

  file { '/usr/local/bin/wacom-hackerspace.sh':
    ensure => absent
  }

  file { 'h10-wacom':
    path   => '/usr/local/bin/h10-wacom',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    # notify  => Reboot['after_run'],
    source => 'puppet:///modules/profile/config/h10-wacom.sh',
  }


#This doesn't work
# systemd::unit_file { 'h10-wacom.service':
#   source => "puppet:///modules/profile/config/h10-wacom.service",
# }
# ~> service {'h10-wacom':
#   ensure => 'running',
# }

}
