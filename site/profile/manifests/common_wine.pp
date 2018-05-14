class profile::common_wine {

  package { 'wine':
    ensure  => latest,
  }

  package { 'playonlinux':
    ensure => latest,
  }

}