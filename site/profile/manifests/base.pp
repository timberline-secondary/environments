#
class profile::base {

  # class { 'snapd': }
  #the base profile should include component modules that will be on all nodes

  # MOTD
  $timestamp = generate('/bin/date')
  file { '/etc/motd':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "Running on the new puppet role/profile paradigm. Last run: ${timestamp}\n",
  }

  package { 'ssh':
    # ssh package includes both openssh-server and client
    ensure  => latest,
  }

  package { 'ntp':
    ensure  => latest,
  }

  package { 'cowsay':
    ensure => latest,
  }

  file { 'usr/local/bin/h10-motd.txt':
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/profile/config/h10-motd.txt',
  }

  file { 'usr/local/bin/h10-motd.cow':
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/profile/config/h10-motd.cow',
  }

  file { '/usr/local/bin/h10-motd':
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
    source => 'puppet:///modules/profile/config/h10-motd.sh',
  }


}
