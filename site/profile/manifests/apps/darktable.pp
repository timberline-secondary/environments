class profile::apps::darktable {

  package { 'darktable':
      ensure  => latest,
  }
}
