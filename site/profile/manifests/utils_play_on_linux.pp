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
      'id'     => 'http://deb.playonlinux.com/public.gpg',
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
