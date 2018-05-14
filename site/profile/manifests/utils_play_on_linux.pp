class profile::utils_play_on_linux {

  include profile::common_wine
  include apt

  apt::source { 'play_on_linux':
    location => 'http://deb.playonlinux.com/',
    repos    => 'main',
    key      => {
      'id'     => 'D8538615FEAC389FDF848C2273F0D6E88E3D6C3A',
      #'server' => 'https://keyserver.ubuntu.com',
      'source'  => 'http://deb.playonlinux.com/public.gpg',
    },
  }

  package { 'playonlinux':
    ensure => latest,
  }
}
