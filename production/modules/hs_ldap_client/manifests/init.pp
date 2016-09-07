class hs_ldap_client {

  class { 'fstab' : }
  
  package { libnss-ldap:
    ensure => present,
    #notify => Reboot['after_run'],
  } ->
  file { 'ldap.conf':
    path    => '/etc/ldap.conf',
    ensure  => file,
    require => Package['libnss-ldap'],
    source  => "puppet:///modules/hs_ldap_client/ldap.conf",
    #notify  => Reboot['after_run'],
  } ->
  file { 'ldap.secret':
    path    => '/etc/ldap.secret',
    ensure  => file,
    require => Package['libnss-ldap'],
    mode    => '0400',		
    source  => "puppet:///modules/hs_ldap_client/ldap.secret",
    #notify  => Reboot['after_run'],
  } ->
  file { 'nsswitch.conf':
    path    => '/etc/nsswitch.conf',
    ensure  => file,
    require => Package['libnss-ldap'],
    source  => "puppet:///modules/hs_ldap_client/nsswitch.conf",
    #notify  => Reboot['after_run'],
    # This file is in: modules/hs_ldap_client/files
  } ->
  file { 'common-session':
    path    => '/etc/pam.d/common-session',
    ensure  => file,
    require => Package['libnss-ldap'],
    source  => "puppet:///modules/hs_ldap_client/pam.d/common-session",
    #notify  => Reboot['after_run'],
  } ->
  file { 'common-password':
    path    => '/etc/pam.d/common-password',
    ensure  => file,
    require => Package['libnss-ldap'],
    source  => "puppet:///modules/hs_ldap_client/pam.d/common-password",
    #notify  => Reboot['after_run'],
  } ->
  fstab::mount { '/home':
    ensure  => 'mounted',
    device  => '192.168.43.4:/nfshome',
    options => 'auto,noatime,bg,tcp,hard',
    fstype  => 'nfs',
    #notify  => Reboot['after_run'],
  } ~>
  reboot { 'after_run':
    apply  => 'finished',
  }
  
  #this is set up directly by preseed file on install as well.
  file { '/etc/lightdm':
    ensure  => directory,
  }
  
  file { 'lightdm.conf':
    path    => '/etc/lightdm/lightdm.conf',
    ensure  => file,
    source  => "puppet:///modules/hs_ldap_client/lightdm/lightdm.conf",
    require => File['/etc/lightdm'],
  }

}
