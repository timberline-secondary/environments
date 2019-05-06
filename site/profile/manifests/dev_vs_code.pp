class profile::vs_code {

  package { 'code':
    ensure   => latest,
    provider => snap,
  }
}