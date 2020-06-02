#
class profile::apps::krita {

  package { 'krita':
    ensure  => latest,
  }

}
