class profile::dev_vs_code {

  package { 'code':
    ensure   => latest,
    provider => snap,
  }
}