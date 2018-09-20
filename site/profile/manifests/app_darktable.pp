class profile::app_darktable {

  include apt

  package { 'darktable':
      ensure  => latest,
  }


}
