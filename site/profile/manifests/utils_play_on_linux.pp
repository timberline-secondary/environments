class profile::utils_play_on_linux {

  include profile::common_wine
  include apt

  apt::source { 'play_on_linux':
    comment  => 'Play on Linux Repo',
    location => 'http://deb.playonlinux.com/',
    repos    => 'main',
    #release   => 'sylvia',

    # pin      => '-10',
    key      => {
      'id'     => 'D8538615FEAC389FDF848C2273F0D6E88E3D6C3A',
      'server' => 'subkeys.pgp.net',
    },
    # include  => {
    #   'src' => true,
    #   'deb' => true,
    # },
  }

  package { 'playonlinux':
    ensure => latest,
  }
}
