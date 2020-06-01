#
class profile::config::ldap_client {

  include profile::utils::reboot_after_run

  package { 'libnss-ldapd':
    ensure => latest,
    #notify => Reboot['after_run'],
  }

  file { 'ldap.conf':
    ensure  => file,
    path    => '/etc/ldap.conf',
    require => Package['libnss-ldapd'],
    source  => 'puppet:///modules/profile/ldap_client/ldap.conf',
    notify  => Reboot['after_run'],
  }

  file { 'ldap.secret':
    ensure  => file,
    path    => '/etc/ldap.secret',
    require => Package['libnss-ldapd'],
    mode    => '0400',
    source  => 'puppet:///modules/profile/ldap_client/ldap.secret',
    notify  => Reboot['after_run'],
  }

  # Add ldap to passwd, group, and shadow servives
  file_line { 'nsswitch.conf/passwd':
    path    => '/etc/nsswitch.conf',
    match   => '^passwd:',
    line    => 'passwd:         files ldap',
    require => Package['libnss-ldapd'],
    notify  => Reboot['after_run'],
  }
  file_line { 'nsswitch.conf/group':
    path    => '/etc/nsswitch.conf',
    match   => '^group:',
    line    => 'group:          files ldap',
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

  file { 'common-session':
    ensure  => file,
    path    => '/etc/pam.d/common-session',
    require => Package['libnss-ldapd'],
    source  => 'puppet:///modules/profile/ldap_client/pam.d/common-session',
    notify  => Reboot['after_run'],
  }

  file { 'common-password':
    ensure  => file,
    path    => '/etc/pam.d/common-password',
    require => Package['libnss-ldapd'],
    source  => 'puppet:///modules/profile/ldap_client/pam.d/common-password',
    notify  => Reboot['after_run'],
  }
}
