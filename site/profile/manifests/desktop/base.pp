#
class profile::desktop::base {

  package { 'ubuntu-desktop':
    ensure  => latest,
  }

}
