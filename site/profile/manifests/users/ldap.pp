class profile::users::ldap {

  package { libnss-ldap:
    ensure    => latest,
  } ->
  ini_setting { "ldap-base":
    ensure            => present,
    path              => '/etc/ldap.conf',
    setting           => 'base',
    value             => 'dc=hackerspace,dc=tbl',
    key_val_separator => ' ',
  } ->
  ini_setting { 'ldap-uri':
    ensure            => present,
    path              => '/etc/ldap.conf',
    setting           => 'uri',
    value             => 'ldap://192.168.43.3',
    key_val_separator => ' ',
  } ->
  ini_setting { 'ldap-rootbinddn':
    ensure            => present,
    path              => '/etc/ldap.conf',
    setting           => 'rootbinddn',
    value             => 'cn=admin,dc=hackerspace,dc=tbl',
    key_val_separator => ' ',
  } ->
  file { '/etc/ldap.secret':
    ensure  => file,
    mode    => '0400',
    # place the file in site/profile/files/users/ldap/ldap.secret
    source  => "puppet:///modules/profile/users/ldap/ldap.secret",
  }

  class { 'nsswitch':
    passwd  => ['ldap', 'files'],
    group   => ['ldap', 'files'],
    shadow  => ['ldap', 'files'],
    hosts   => ['files', 'dns'],
    require => Package['libnss-ldap'],
    subscribe => Package['libnss-ldap'],
  }

  # PAM
  file_line { 'pam-password-remove-authtok':
    # remove `use_authtok` from before try_first_pass so users can change their own passwords
    # https://ubuntuforums.org/showthread.php?t=1640070
    ensure => present,
    path   => '/etc/pam.d/common-password',
    line   => 'password	[success=1 user_unknown=ignore default=die]	pam_ldap.so try_first_pass',
    match  => '^password\s.*use_authtok',
    require => Package['libnss-ldap'],
    subscribe => Package['libnss-ldap'],
  }

  # Should add pam_mkhomedir.so to common-session, but need to mount too...
  # current home drives created on account creation by script


  /*reboot { 'after_run':
    apply  => 'finished',
  }*/




  ##############################################

  # #this is set up directly by preseed file on install as well.
  # file { '/etc/lightdm':
  #   ensure  => directory,
  # }
  #
  # # https://help.ubuntu.com/community/NumLock
  # package { numlockx:
  #   ensure => latest,
  # }
  #
  # file { 'lightdm.conf':
  #   path    => '/etc/lightdm/lightdm.conf',
  #   ensure  => file,
  #   source  => "puppet:///modules/hs_ldap_client/lightdm/lightdm.conf",
  #   require => File['/etc/lightdm'],
  # }

}