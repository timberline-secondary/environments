#
class profile::apps::blender {

  package { 'blender':
    ensure  => latest,
  }

}
