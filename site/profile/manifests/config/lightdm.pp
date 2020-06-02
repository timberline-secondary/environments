# Installs lightDM and configures it: 
# - Sets it to the deafult display manager
# - Enables the Guest session
class profile::config::lightdm {

  include profile::utils::reboot_after_run

  package { 'lightdm':
    ensure => latest,
  }


  # make lightdm default
  file {'default-display-manager':
    ensure  => file,
    path    => '/etc/X11/default-display-manager',
    content => "/usr/sbin/lightdm\n",
    require => Package['lightdm'],
    notify  => Reboot['after_run']
  }
  debconf { 'default-x-display-manager':
    package => 'lightdm',
    item    => 'shared/default-x-display-manager',
    type    => 'select',
    value   => 'lightdm',
    seen    => true,
    require => Package['lightdm'],
    notify  => Exec['dpkg-reconfigure lightdm']
  }

  file { 'lightdm.conf':
    ensure  => file,
    path    => '/etc/lightdm/lightdm.conf',
    content => "# MANAGED BY PUPPETMASTER
[SeatDefaults]
allow-guest=true
greeter-show-manual-login=true
greeter-hide-users=true
greeter-setup-script=/usr/bin/numlockx on\n",
    require => Package['lightdm'],
  }

  exec {'dpkg-reconfigure lightdm':
    path        => ['/usr/bin/', '/usr/sbin'],
    refreshonly => true,
    notify      => Reboot['after_run']
  }

}
