#
class profile::config::ldap_client {

  include profile::utils::reboot_after_run

  package { 'libnss-ldapd':
    ensure => latest,
    #notify => Reboot['after_run'],
  }

  # configure nslcd
  file_line { 'nslcd.conf/uri':
    path    => '/etc/nslcd.conf',
    match   => '^uri\ ldap://',
    line    => 'uri ldap://192.168.43.3',
    require => Package['libnss-ldapd'],
    notify  => Reboot['after_run'],
  }
  file_line { 'nslcd.conf/base':
    path    => '/etc/nslcd.conf',
    match   => '^base\ dc\=',
    line    => 'base dc=hackerspace,dc=tbl',
    require => Package['libnss-ldapd'],
    notify  => Reboot['after_run'],
  }
  file_line { 'nslcd.conf/base':
    path    => '/etc/nslcd.conf',
    match   => '^#?rootpwmoddn',  # could start with a # on first install
    line    => 'rootpwmoddn cn=admin,dc=hackerspace,dc=tbl',
    require => Package['libnss-ldapd'],
    notify  => Reboot['after_run'],
  }

  # file { 'ldap.conf':
  #   ensure  => file,
  #   path    => '/etc/ldap.conf',
  #   require => Package['libnss-ldapd'],
  #   source  => 'puppet:///modules/profile/ldap_client/ldap.conf',
  #   notify  => Reboot['after_run'],
  # }

  # file { 'ldap.secret':
  #   ensure  => file,
  #   path    => '/etc/ldap.secret',
  #   require => Package['libnss-ldapd'],
  #   mode    => '0400',
  #   source  => 'puppet:///modules/profile/ldap_client/ldap.secret',
  #   notify  => Reboot['after_run'],
  # }

  # Add ldap to passwd, group, and shadow servives
  file_line { 'nsswitch.conf/passwd':
    path    => '/etc/nsswitch.conf',
    match   => '^passwd:',
    line    => 'passwd:         files systemd ldap',
    require => Package['libnss-ldapd'],
    notify  => Reboot['after_run'],
  }
  file_line { 'nsswitch.conf/group':
    path    => '/etc/nsswitch.conf',
    match   => '^group:',
    line    => 'group:          files systemd ldap',
    require => Package['libnss-ldapd'],
    notify  => Reboot['after_run'],
  }
  file_line { 'nsswitch.conf/shadow':
    path    => '/etc/nsswitch.conf',
    match   => '^shadow:',
    line    => 'shadow:         files ldap',
    require => Package['libnss-ldapd'],
    notify  => Reboot['after_run'],
  }

  # file { 'common-session':
  #   ensure  => file,
  #   path    => '/etc/pam.d/common-session',
  #   require => Package['libnss-ldapd'],
  #   source  => 'puppet:///modules/profile/ldap_client/pam.d/common-session',
  #   notify  => Reboot['after_run'],
  # }

  # file { 'common-password':
  #   ensure  => file,
  #   path    => '/etc/pam.d/common-password',
  #   require => Package['libnss-ldapd'],
  #   source  => 'puppet:///modules/profile/ldap_client/pam.d/common-password',
  #   notify  => Reboot['after_run'],
  # }
}
