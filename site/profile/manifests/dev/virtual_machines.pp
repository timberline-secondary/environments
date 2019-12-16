#
class profile::dev::virtual_machines {

  package { 'virtualbox':
    ensure => latest,
  }

  package { 'vagrant':
    ensure => latest,
  }

}
