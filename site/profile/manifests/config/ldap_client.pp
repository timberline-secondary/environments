#
class profile::config::ldap_client {

  package { 'libnss-ldap':
    ensure => present,
    #notify => Reboot['after_run'],
  }
  -> file { 'ldap.conf':
    ensure  => file,
    path    => '/etc/ldap.conf',
    require => Package['libnss-ldap'],
    source  => 'puppet:///modules/profile/ldap_client/ldap.conf',
    #notify  => Reboot['after_run'],
  }
  -> file { 'ldap.secret':
    ensure  => file,
    path    => '/etc/ldap.secret',
    require => Package['libnss-ldap'],
    mode    => '0400',
    source  => 'puppet:///modules/profile/ldap_client/ldap.secret',
    #notify  => Reboot['after_run'],
  }
  -> file { 'nsswitch.conf':
    ensure  => file,
    path    => '/etc/nsswitch.conf',
    require => Package['libnss-ldap'],
    source  => 'puppet:///modules/profile/ldap_client/nsswitch.conf',
    #notify  => Reboot['after_run'],
    # This file is in: modules/hs_ldap_client/files
  }
  -> file { 'common-session':
    ensure  => file,
    path    => '/etc/pam.d/common-session',
    require => Package['libnss-ldap'],
    source  => 'puppet:///modules/profile/ldap_client/pam.d/common-session',
    #notify  => Reboot['after_run'],
  }
  -> file { 'common-password':
    ensure  => file,
    path    => '/etc/pam.d/common-password',
    require => Package['libnss-ldap'],
    source  => 'puppet:///modules/profile/ldap_client/pam.d/common-password',
  }
  ~> reboot { 'after_run':
    apply  => 'finished',
  }
