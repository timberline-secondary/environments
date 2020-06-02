#
class profile::apps::godot {

  package { 'godot':
    ensure  => latest,
  }

}
