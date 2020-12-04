# Vim sometimes defaults as the editor for .sh files which is really annoying for simple scripts
class profile::dev::vim {

  package { 'vim':
    ensure => purged,
  }

}
