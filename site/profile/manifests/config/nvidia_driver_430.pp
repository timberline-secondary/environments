# requires rgb-nvidia module
class profile::config::nvidia_driver_430 {

  # include apt

  # make executable with mode 755
  # wget::fetch { 'netrender-watchdog.py':
  #   source      => 'https://raw.githubusercontent.com/timberline-secondary/systemd-blender-netrender/master/netrender-watchdog.py',
  #   destination => '/tmp/',
  #   cache_dir   => '/var/cache/wget',
  #   mode        => '0755',
  # }

  # apt::ppa { 'ppa:graphics-drivers/ppa':
  #   ensure => present,
  # }

  # package {'nvidia-430 ':
  #   ensure  => latest,
  #   require => [ Class['apt::update'], Apt::Ppa['ppa:graphics-drivers/ppa'] ],
  #   notify  => Reboot['after_nvidia'],
  # }

  # https://forge.puppet.com/puppetlabs/reboot
  reboot { 'after_nvidia':
    apply  => finished,
  }

}
