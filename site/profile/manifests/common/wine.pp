class profile::common::wine {

  package { 'wine':
    ensure  => latest,
  }

}
