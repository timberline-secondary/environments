#
class profile::utils::network {

  package { 'nettools':
    ensure  => latest,
  }

  package { 'nmap':
    ensure  => latest,
  }

}
