#
class profile::config::grub {

  # Kernel Update to 6.0 is causing boot problems, need to pin kernel
  $kernel_id = '5.4.0-131-generic'
  $grub_menu_kernel = "Advanced options for Ubuntu>Ubuntu, with Linux ${kernel_id}"
  $kernel_image = "linux-image-${kernel_id}"
  $kernel_headers = "linux-headers-${kernel_id}"

  package {$kernel_image:
    ensure  => latest,
  }

  file_line { '/etc/default/grub':
    path      => '/etc/default/grub',
    line      => "GRUB_DEFAULT=\"${grub_menu_kernel}\"",
    match     => '^GRUB_DEFAULT',
    subscribe => Package[$kernel_image],
    notify    => Exec['update_grub', 'pin_kernel'],
  }

  # don't let this working kernel be deleted!
  exec { 'pin_kernel':
    command     => "/usr/bin/apt-mark hold ${kernel_image} ${kernel_headers}",
    refreshonly => true,
  }

  exec { 'update_grub' :
    command     => '/usr/sbin/update-grub',
    refreshonly => true,
  }

}
