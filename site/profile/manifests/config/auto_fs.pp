#
class profile::config::auto_fs {

  # mapcontents => ['* -user,rw,soft,intr,rsize=32768,wsize=32768,tcp,nfsvers=3,noacl tyrell:/nfshome/&'],

  ############################################
  #
  #            AUTO FS
  # https://help.ubuntu.com/community/Autofs
  # file_line: https://forge.puppet.com/puppetlabs/stdlib#resources
  #############################################

  package { 'autofs':
    ensure => present,
  }
  file { 'auto.home':
    ensure  => file,
    path    => '/etc/auto.home',
    content => '* -fstype=nfs,rw,async tyrell:/nfshome/&',
    require => Package['autofs'],
  }
  file_line { 'auto.master':
    path    => '/etc/auto.master',
    line    => '/home   /etc/auto.home',
    require => Package['autofs'],
  }
