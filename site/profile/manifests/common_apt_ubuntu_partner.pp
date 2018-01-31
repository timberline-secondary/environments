class profile::common_apt_ubuntu_partner {

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


}