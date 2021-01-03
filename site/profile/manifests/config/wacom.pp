# configure wacom tablet when user logs in.
class profile::config::xsetwacom {

  file { '/etc/profile.d/configure_wacom.sh':
    ensure => absent
  }

  file { 'wacom_hackerspace':
    path   => '/usr/local/bin/wacom_hackerspace.sh',
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    # notify  => Reboot['after_run'],
    source => 'puppet:///modules/cofnig/wacom_hackerspace.sh',
  }


systemd::unit_file { 'h10-wacom.service':
  source => 'puppet:///modules/cofnig/h10-wacom.service',
}
~> service {'h10-wacom':
  ensure => 'running',
}

}
