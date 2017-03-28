class hs_student_apps::blender {

  include apt
  
  apt::ppa { 'ppa:thomas-schiex/blender':
    ensure => present,
  }

  # package {'libopensubdiv':
  #   require => Package['blender'],
  # }

  package { 'blender':
    ensure  => latest,
    require => [ Class['apt::update'], Apt::Ppa['ppa:thomas-schiex/blender'] ],
  }
  #
  # file { 'thomas-schiex/blender':
  #   path    => '/etc/apt/sources.list.d/thomas-schiex-ubuntu-blender-xenial.list',
  #   ensure  => present,
  # }
  # file { 'thomas-schiex/blender2':
  #   path    => '/etc/apt/sources.list.d/thomas-schiex-ubuntu-blender-xenial.list.save',
  #   ensure  => present,
  # }
  
  # Overwrite netrender addon to allow for use of GPU on slaves
  # https://github.com/WARP-LAB/Blender-Network-Render-Additions
  
  # fully managed directory: https://christian.hofstaedtler.name/blog/2008/11/puppet-managing-directories-recursively.html
  file { 'blender-netrender-addon':
    path    => '/usr/share/blender/2.78/scripts/addons/netrender',
    recurse => true,
    purge   => true,
    force   => true,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    ensure  => directory,
    require => Package['blender'],
    source  => 'puppet:///modules/hs_student_apps/blender/netrender',
  } 

}
