class profile::dev_vm {

  package { 'virtualbox':
    ensure => latest,
  }

  package { 'vagrant':
    ensure => latest,
  }

}
