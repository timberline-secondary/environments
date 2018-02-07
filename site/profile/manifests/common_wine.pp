class profile::common_wine {

  package { 'wine':
    ensure  => latest,
  }

}