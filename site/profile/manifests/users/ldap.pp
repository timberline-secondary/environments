class profile::users::ldap {

  # class { 'ldap::client':
  #   uri   => 'ldap://192.168.43.3',
  #   base  => 'dc=hackerspace,dc=tbl' ,
  # }

  package { libnss-ldap:
    ensure    => latest,
  } ->
  ini_setting { "ldap":
    ensure  => present,
    path    => '/etc/ldap.conf',
    setting => 'base dc',
    value   => 'hackerspace,dc=TTT'
  }




/*
  class { 'fstab': }

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
    ensure  => 'absent',
    device  => '192.168.43.4:/nfshome',
    options => 'auto,noatime,bg,tcp,hard',
    fstype  => 'nfs',
    #notify  => Reboot['after_run'],
  } ~>
  reboot { 'after_run':
    apply  => 'finished',
  }

  # mapcontents => ['* -user,rw,soft,intr,rsize=32768,wsize=32768,tcp,nfsvers=3,noacl tyrell:/nfshome/&'],

  ############################################
  #
  #            AUTO FS
  # https://help.ubuntu.com/community/Autofs
  # file_line: https://forge.puppet.com/puppetlabs/stdlib#resources
  #############################################

  package { autofs:
    ensure => present,
  }
  file { 'auto.home':
    path    => '/etc/auto.home',
    ensure  => file,
    content => "* -fstype=nfs,rw,async tyrell:/nfshome/&",
    require => Package['autofs'],
  }
  file_line { 'auto.master':
    path    => '/etc/auto.master',
    line    => '/home   /etc/auto.home',
    require => Package['autofs'],
  }

  ##############################################

  #this is set up directly by preseed file on install as well.
  file { '/etc/lightdm':
    ensure  => directory,
  }

  # https://help.ubuntu.com/community/NumLock
  package { numlockx:
    ensure => latest,
  }

  file { 'lightdm.conf':
    path    => '/etc/lightdm/lightdm.conf',
    ensure  => file,
    source  => "puppet:///modules/hs_ldap_client/lightdm/lightdm.conf",
    require => File['/etc/lightdm'],
  }
*/
}