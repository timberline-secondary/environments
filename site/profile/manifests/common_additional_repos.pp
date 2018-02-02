class profile::common_additional_repos {

  include apt

  apt::source { 'ubuntu_partners':
    comment  => 'Canonical Partners Repo',
    location => 'http://archive.canonical.com/ubuntu',
    repos    => 'partner',
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

  #   deb http://mirrors.evowise.com/linuxmint/packages sylvia main upstream import backport

  apt::source { 'mint_sylvia_imports' :
    location  => 'http://mirrors.evowise.com/linuxmint/packages',
    release  => 'sylvia',
    repos    => 'import',
  }

  apt::source {'mint_repo' :
    ensure  => absent,
  }

  package { 'linuxmint-keyring':
    ensure  => latest,
    install_options => ['--allow-unauthenticated'],
  }



}