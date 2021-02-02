#
class profile::utils::network {

  package { 'net-tools':
    ensure  => latest,
  }

  package { 'nmap':
    ensure  => latest,
  }

}
