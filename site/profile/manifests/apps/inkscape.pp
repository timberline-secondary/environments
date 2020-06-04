#
class profile::apps::inkscape {

  package { 'inkscape':
    ensure  => latest,
  }

}
