#
class profile::dev::python {

  package { 'python-is-python3':
      ensure => latest,
  }

  package { 'idle3':
    ensure  => latest,
  }

}
