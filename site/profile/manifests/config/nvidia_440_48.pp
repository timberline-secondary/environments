# requires rgb-nvidia module
class profile::config::nvidia_440_48 {

  package { 'dkms':
    ensure => latest,
  }

  $driver_number      = '440.48.02'  #440.31
  $driver_name        = "NVIDIA-Linux-x86_64-${driver_number}.run"
  $nvidia_driver_src  = "http://us.download.nvidia.com/XFree86/Linux-x86_64/${driver_number}/${driver_name}"
  $driver_location    = "/opt/${driver_name}"

  archive { $driver_name:
    ensure => present,
    path   => $driver_location,
    source => $nvidia_driver_src,
  }

  exec { 'Install Nvidia drivers':
    # https://unix.stackexchange.com/questions/545807/how-to-automate-selections-when-installing-via-cli/545809?noredirect=1#comment1013710_545809
    command     => "bash ${driver_location} --disable-nouveau --run-nvidia-xconfig --no-x-check --dkms --silent",
    path        => $::path, # from Factor
    subscribe   => Archive[$driver_name],
    refreshonly => true,
    notify      => Reboot['after_nvidia'],
    require     => Package['dkms'],
  }

  # https://forge.puppet.com/puppetlabs/reboot
  reboot { 'after_nvidia':
    apply  => finished,
  }

}
