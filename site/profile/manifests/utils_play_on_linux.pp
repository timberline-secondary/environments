class profile::utils_play_on_linux {

  include profile::common_wine
  include apt

  apt::source { 'play_on_linux':
    comment  => 'Play on Linux Repo',
    location => 'http://deb.playonlinux.com/',
    repos    => 'main',
    #release   => 'sylvia',

    # pin      => '-10',
    # key      => {
    #   'id'     => 'A1BD8E9D78F7FE5C3E65D8AF8B48AD6246925553',
    #   'server' => 'subkeys.pgp.net',
    # },
    # include  => {
    #   'src' => true,
    #   'deb' => true,
    # },
  }

  package { 'playonlinux':
    ensure => latest,
  }
}
